#!/usr/bin/python
# -*- coding: UTF-8 -*-
import os
import time
import cPickle
import datetime
import logging
import optparse
import tornado.wsgi
import werkzeug
import tornado.httpserver
import numpy as np
import pandas as pd
from PIL import Image
import cStringIO as StringIO
import urllib
from sqlite3 import dbapi2 as sqlite3
from flask import Flask, request, session, \
    g, redirect, url_for, abort, \
    render_template, flash
import util
import jinja2


# create our little application :)
app = Flask(__name__)

# Load default config and override
# config from an environment variable
app.config.update(dict(
    DATABASE=os.path.join(app.root_path, 'flaskr.db'),
    DEBUG=True,
    SECRET_KEY='development key',
    USERNAME='admin',
    PASSWORD='default'
))
app.config.from_envvar('FLASKR_SETTINGS', silent=True)
is_mobile = False


def connect_db():
    """Connects to the specific database."""
    rv = sqlite3.connect(app.config['DATABASE'])
    rv.row_factory = sqlite3.Row
    return rv


def init_db():
    with app.app_context():
        db = get_db()
        with app.open_resource('schema.sql', mode='r') as f:
            db.cursor().executescript(f.read())
        db.commit()


@app.cli.command('initdb')
def initdb_command():
    """Creates the database tables."""
    init_db()
    print('Initialized the database.')


def get_db():
    """Opens a new database connection
    if there is none yet for the
    current application context.
    """
    if not hasattr(g, 'sqlite_db'):
        g.sqlite_db = connect_db()
    return g.sqlite_db


@app.teardown_appcontext
def close_db(error):
    """Closes the database again at
    the end of the request."""
    if hasattr(g, 'sqlite_db'):
        g.sqlite_db.close()


def start_tornado(app_, port=5000):
    http_server = tornado.httpserver.HTTPServer(
        tornado.wsgi.WSGIContainer(app_))
    http_server.listen(port)
    print("Tornado server starting on port {}".format(port))
    tornado.ioloop.IOLoop.instance().start()


def start_from_terminal(app_):
    """
    Parse command line options and start the server.
    """
    parser = optparse.OptionParser()
    parser.add_option(
        '-d', '--debug',
        help="enable debug mode",
        action="store_true", default=False)
    parser.add_option(
        '-p', '--port',
        help="which port to serve content on",
        type='int', default=5000)

    opts, args = parser.parse_args()

    if opts.debug:
        app_.run(debug=True, host='0.0.0.0', port=opts.port)
    else:
        start_tornado(app_, opts.port)


# 添加学院到数据库中
@app.route('/add_department', methods=['GET', 'POST'])
def add_department():
    if not session.get('logged_in'):
        # print session.get('logged_in')
        return redirect(url_for('admin_login'))
    db = get_db()
    db.execute('insert into departments (departmentID, departmentName) values (?, ?)',
               [request.form['departmentID'], request.form['departmentName']])
    db.commit()
    return redirect(url_for('show_entries'))


@app.route('/')
@app.route('/index')
def index():
    jsfile = os.listdir('./static/dist/js/i18n')
    db = get_db()
    cur = db.execute('select * from departments')
    departments = cur.fetchall()
    is_mobile = util.checkMobile(request)
    return render_template('index.html',
                           departments=departments,
                           jsfile=jsfile,
                           is_mobile=is_mobile)


@app.route('/show_entries')
def show_entries():
    db = get_db()
    cur = db.execute('select departmentID, departmentName from departments')  # order by id desc')
    departments = cur.fetchall()
    return render_template('show_entries.html', departments=departments)


@app.route('/add', methods=['POST'])
def add_entry():
    if not session.get('logged_in'):
        abort(401)
    db = get_db()
    cur = db.execute('select count(studentID) as cnt from students')
    # print cur.fetchone()
    num = cur.fetchone()['cnt'] + 1
    # print cur.arraysize, num
    db.execute('insert into students (studentID, studentDepartment, id) values (?, ?, ?)',
               [request.form['title'], request.form['text'], num])
    db.commit()
    flash('New entry was successfully posted')
    return redirect(url_for('show_entries'))


@app.route('/login', methods=['GET', 'POST'])
def login():
    error = None
    # print app.config['USERNAME'], app.config['PASSWORD']
    if request.method == 'POST':
        db = get_db()
        user = db.execute('select count(studentID) as cnt from students where studentID = ?',
                          request.form['username'])
        if user.fetchone()['cnt'] >= 1:
            return 'you have finished the paper'
        else:
            session['username'] = request.form['username']
            flash('You were logged in')
            return redirect(url_for('show_entries'))
    return render_template('login.html', error=error)


@app.route('/logout')
def logout():
    session.pop('username', None)
    session.pop('logged_in', None)
    flash('You were logged out')
    return redirect(url_for('show_entries'))


@app.route('/admin_login', methods=['GET', 'POST'])
def admin_login():
    error = None
    print 'admin log'
    if request.method == 'POST':
        if request.form['username'] != app.config['USERNAME']:
            error = 'Invalid username'
        elif request.form['password'] != app.config['PASSWORD']:
            error = 'Invalid password'
        else:
            session['logged_in'] = True
            session['username'] = request.form['username']
            flash('You have logged in')
            return redirect(url_for('show_entries'))
    return render_template('login.html', error=error)


@app.route('/show_problem', methods=['POST', 'GET'])
def show_problem():
    if request.method == 'GET' and \
            not (session.get('studentID') or
                 not session.get('department')):
        return redirect(url_for('index'))
    if session.get('studentID') and session.get('department'):
        department = session.get('department')
        studentID = session.get('studentID')
    else:
        department = request.form['department']
        studentID = request.form['studentID']
        session['studentID'] = studentID
        session['department'] = department
    param = {}
    # if studentID == '' or not studentID:
    #     flash(u'你的学号不正确, 请重新输入!!!')
    #     return redirect(url_for('index'))
    # if len(studentID) < 10:
    #     flash(u'您输入的学号有误, 请输入10位学号')
    #     return redirect(url_for('index'))
    db = get_db()
    cur = db.execute('select * from students where studentID = ?', (studentID,))
    # is_finish = 0
    if cur.fetchall().count('studentID') >= 1:
        is_finish = cur.fetchone()['finish']
        if is_finish:
            # 登陆过并且已经作答完毕
            pass
        else:
            # 登陆过但还没答完
            pass
    else:
        # 第一次登录
        pass
    cur = db.execute('select departmentName from departments where departmentID = ?',
                     (department,))
    param['user'] = [cur.fetchone()['departmentName'], studentID]
    param['is_mobile'] = util.checkMobile(request)
    param['question_num'] = 22
    param['numperpage'] = 10
    return render_template('show_problem.html', param=param)


@app.route('/add_table', methods=['GET', 'POST'])
def add_table():
    print '1323'
    if not session.get('logged_in'):
        return redirect(url_for('admin_login'))
    return render_template('add_table.html', session=session,
                           tables=[])


if __name__ == '__main__':
    app.secret_key = os.urandom(24)
    start_from_terminal(app)
