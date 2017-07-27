#!/usr/bin/python
# -*- coding: UTF-8 -*-
import os
import time
import optparse
import tornado.wsgi
import os.path as path
import tornado.httpserver

from flask import Flask, request, session, \
    g, redirect, url_for, abort, \
    render_template, flash
import util
import jinja2
from transwarp import db
from models import departments, students, \
    question, student_ques, log, Manager
import re


# create our little application :)
app = Flask(__name__)

app.config.from_envvar('FLASKR_SETTINGS', silent=True)


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


def check(s2, s3):
    if s2 < 15 or s2 + s3 < 20:
        return u'建议: 选择基础班'
    elif (s2 > 25 and s3 > 10) \
            or s2 + s3 > 40:
        return u'建议: 选择实验班'
    else:
        return u'建议: 选择普通班'


# 添加学院到数据库中
@app.route('/add_department', methods=['GET', 'POST'])
def add_department():
    if not session.get('username'):
        # print session.get('logged_in')
        return redirect(url_for('admin_login'))
    department = departments(request.form['departmentID'],
                             request.form['departmentName'])
    try:
        department.insert()
    except Exception, e:
        print e
        return
    return redirect(url_for('show_entries'))


# @app.route('/')
@app.route('/index')
def index():

    basepath=path.dirname(__file__)
    jspath=path.join(basepath,'static/dist/js/i18n')
    jsfile = os.listdir(jspath)
    session.pop('studentID', None)
    session.pop('department', None)
    session.pop('studentName', None)
    try:
        all_departments = departments.find_all()
    except Exception, e:
        flash('%s, please retry later.' % e)
        all_departments = []
    is_mobile = util.checkMobile(request)
    return render_template('index.html',
                           departments=all_departments,
                           jsfile=jsfile,
                           is_mobile=is_mobile)


@app.route('/show_entries')
def show_entries():
    try:
        all_departments = departments.find_all()
    except Exception, e:
        all_departments = []
        flash('%s, please retry later' % e)
    try:
        questions = question.find_all()
        for q in questions:
            q['option'] = q['option'].split(';')
            if q['type'] == 0:
                q['type'] = 'single select'
            elif q['type'] == 1:
                q['type'] = 'multi select'
            else:
                q['type'] = 'option answer'
    except Exception, e:
        questions = []
        flash('%s, please retry later' % e)
    return render_template('show_entries.html',
                           departments=all_departments,
                           questions=questions)


@app.route('/logout')
def logout():
    session.pop('username', None)
    session.pop('logged_in', None)
    flash('You were logged out')
    return redirect(url_for('show_entries'))


@app.route('/admin_login', methods=['GET', 'POST'])
def admin_login():
    error = None
    if request.method == 'POST':
        try:
            manager = Manager.get(request.form['username'])
        except Exception, e:
            return render_template('admin_login.html', error=e)
        print manager, request.form['password']
        if not manager:
            error = 'username or password is wrong'
        elif request.form['password'] != manager.password:
            error = 'username or password is wrong'
        else:
            session['username'] = request.form['username']
            flash('You have logged in')
            return redirect(url_for('show_entries'))
    return render_template('admin_login.html', error=error)


@app.route('/show_problem', methods=['POST', 'GET'])
def show_problem():
    # print not(session.get('studentID') or session.get('department'))
    if request.method == 'GET' and \
            not (session.get('studentID') or
                 session.get('department')) or session.get('studentName'):
        return redirect(url_for('index'))
    if request.method == 'GET' and \
            session.get('studentID') and \
            session.get('department') and session.get('studentName'):
        department = session.get('department')
        studentID = session.get('studentID')
        studentName = session.get('studentName')
    else:
        department = request.form['department']
        studentID = request.form['studentID']
        studentName = request.form['studentName']
        session['studentID'] = studentID
        session['department'] = department
        session['studentName'] = studentName
    # print request.form
    st1 = students.find_first('where studentID=?', studentID)
    st = students.find_first('where studentID=? and studentName=? and studentDepartment=? and home=? and sex=?',
                             studentID, studentName, department, request.form['home'], request.form['sex'])
    if st1 and not st:
        flash(u"输入的信息与之前不符,请重新输入")
        basepath = path.dirname(__file__)
        jspath = path.join(basepath, 'static/dist/js/i18n')

        jsfile = os.listdir(jspath)
        session.pop('studentID', None)
        session.pop('department', None)
        session.pop('studentName', None)
        try:
            all_departments = departments.find_all()
        except Exception, e:
            flash('%s, please retry later.' % e)
            all_departments = []
        is_mobile = util.checkMobile(request)
        return render_template('index.html',
                               departments=all_departments,
                               jsfile=jsfile,
                               is_mobile=is_mobile)

    # if studentID == '' or not studentID:
    #     flash(u'你的学号不正确, 请重新输入!!!')
    #     return redirect(url_for('index'))
    # if len(studentID) < 10:
    #     flash(u'您输入的学号有误, 请输入10位学号')
    #     return redirect(url_for('index'))

    param = {}
    departmentName = departments.get(department).departmentName
    param['user'] = [departmentName, studentID, studentName]
    param['is_mobile'] = util.checkMobile(request)

    stu = students.get(studentID)
    if studentID == '' or not studentID \
       or request.form['home'] == '' or not request.form['home']:
        flash(u'学号/班级/国别不能维空')
        return redirect(url_for('index'))
    # is_finish = 0
    if stu:
        login_time = time.mktime(stu.logintime.timetuple())
        diff = time.time() - login_time
        if stu.finished or diff >= 3600:
            # 登陆过并且已经作答完毕
            param['suggestion'] = check(stu.score_part2, stu.score_part3)
            return render_template('show_res.html',
                                   param=param)
        else:
            # 登陆过但还没答完
            pass
    else:
        # 第一次登录
        login_time = time.time()
        with db.transaction():
            stu = students(studentID=studentID,
                           studentName=studentName,
                           studentDepartment=department,
                           home=request.form['home'],
                           sex=int(request.form['sex']),
                           logintime=time.strftime("%Y-%m-%d %H:%M:%S", time.localtime()))
            stu.insert()
    ques = question.find_all()
    ques0 = []
    ques1 = []
    for q in ques:
        q['option'] = q['option'].split(';')
        if q['type'] == 0:
            q['type'] = 'single select'
        elif q['type'] == 1:
            q['type'] = 'multi select'
        else:
            q['type'] = 'option answer'
        if q['part'] == 2:
            ques0.append(q)
        else:
            ques1.append(q)
    param['question'] = ques0
    param['question1'] = ques1
    param['question_num1'] = len(param['question1'])
    param['question_num'] = len(param['question'])
    param['numperpage'] = 10
    param['login_time'] = login_time
    # print param['question']
    return render_template('show_problem.html', param=param)


@app.route('/update_data', methods=['GET', 'POST'])
def update_data():
    if request.method == 'GET':
        return '<html><h1>404!!你访问的页面不存在</h1><body></body></html>'
    if not session.get('username'):
        return redirect(url_for('admin_login'))
    t_name = request.form['table']
    op = request.form['operation']

    data = request.form.getlist('data[]')
    num = len(data)
    if t_name == 'department':
        with db.transaction():
            i = 1 if num % 2 else 0
            while i < num:
                departmentID = data[i]
                departmentName = data[i+1]
                i += 2
                departmentE = departments.find_first(
                    'where departmentID=? or departmentName=?',
                    departmentID, departmentName)
                if op == 'add':
                    if departmentE:
                        return "error! The id have already exists"
                    department = departments(
                        departmentID=departmentID,
                        departmentName=departmentName)
                    lg = log(
                        details=u'{} add {} {} into table department'
                        .format(session.get('username'),
                                departmentID, departmentName))
                    try:
                        department.insert()
                        lg.insert()
                    except Exception, e:
                        return e.message
                elif op == 'delete':
                    if not departmentE:
                        return "error! the item doesn't exist"
                    lg = log(
                        details=u'{} delete {} {} from table department'
                        .format(session.get('username'),
                                departmentID, departmentName))
                    try:
                        departmentE.delete()
                        lg.insert()
                    except Exception, e:
                        return e
    elif t_name == 'question':
        with db.transaction():
            if op == 'add':
                ques = question.find_first(
                    'where `title`=? and `option`=? and `type`=? and `difficult`=? and `part`=? and `score`=?',
                    data[0], data[1], data[2], data[3], data[4], data[5]
                )
                if ques:
                    return 'the problem has already existed in database'
                ques = question(
                    title=data[0],
                    option=data[1],
                    type=data[2],
                    difficult=data[3],
                    part=data[4],
                    score=data[5],
                    right_ans=data[6]

                )
                lg = log(
                    details=u'{} add {} into table question'
                    .format(session.get('username'),
                            data[0])
                )
                try:
                    ques.insert()
                    lg.insert()
                except Exception, e:
                    return e.message
            elif op == 'delete':
                i = 1
                while i < num:
                    data[i+1] = data[i+1].replace('<br>', ';')[:-1]
                    ques = question.find_first(
                        'where `title`=? and `option`=? and `type`=? and `difficult`=? and `part`=? and `score`=?',
                        data[i], data[i+1], data[i+2], data[i+3], data[i+4], data[i+5]
                    )
                    lg = log(
                        details=u'{} delete {} from table question'
                        .format(session.get('username'),
                                data[i])
                    )
                    try:
                        ques.delete()
                        lg.insert()
                    except Exception, e:
                        print e.message
                        return e.message
                    i += 6

    return 'success'


@app.route('/result', methods=['GET', 'POST'])
def result():
    if request.method == 'GET':
        return '<html><h1>404!!你访问的页面不存在</h1><body></body></html>'
    # print request.form
    studentID = session.get('studentID')
    score = [0, 0]
    with db.transaction():
        for x in request.form:
            quesID = re.match('ques([0-9]*).*', x).group(1)
            # quesID = int(quesID) + 1
            ans = request.form.getlist(x)
            if len(ans) > 1:
                ans = ';'.join(ans)
            else:
                ans = ans[0]
            # print studentID, quesID, ans
            stu_ques = student_ques(studentID=studentID,
                                    questionID=quesID,
                                    answer=ans)
            # print stu_ques
            try:
                stu_ques.insert()
            except Exception, e:
                # print e.message, e
                if 'Duplicate entry' in str(e):
                    break
                else:
                    return '1'
            s = count_score(quesID, ans)
            score[0] += s[0]
            score[1] += s[1]
        db.update(u'update `students` set finished = 1, '
                  'score_part2 = %d, score_part3 = %d '
                  'where studentID = %s' % (score[0], score[1], studentID))
    param = dict()
    param['is_mobile'] = util.checkMobile(request)
    param['user'] = [departments.get(session.get('department')).departmentName,
                     session.get('studentID'),
                     session.get('studentName')]
    param['suggestion'] = check(score[0], score[1])
    return render_template('show_res.html', param=param)


@app.route('/get_time', methods=['GET'])
def get_time():
    return str(time.time())


@app.route('/')
@app.route('/introduction', methods=['GET', 'POST'])
def intro():
    param = {'is_mobile': util.checkMobile(request)}
    return render_template('intro.html', param=param)


def count_score(quesID, ans):
    score = [0, 0]
    q = question.get(quesID)
    if len(ans) >= 1:
        if q.part == 2 and (q.right_ans == ans or
                            ord(q.right_ans) - 16 == ord(ans)):
            score[0] += q.score
        elif q.right_ans == ans or ord(q.right_ans) - 16 == ord(ans):
            score[1] += q.score
    return score

if __name__ == '__main__':
    from config import configs
    app.secret_key = os.urandom(24)
    db.create_engine(**configs.db)
    start_from_terminal(app)
