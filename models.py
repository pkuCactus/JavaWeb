#!/usr/bin/env python
# -*- coding: utf-8 -*-

'''
Models for user, blog, comment.
'''

import time, uuid
import sys
sys.path.append('./')

from transwarp.db import next_id
from transwarp.orm import Model, StringField, BooleanField, FloatField, TextField, TimeField, IntegerField

class User(Model):
    __table__ = 'users'

    id = StringField(primary_key=True, updatable=False, default=next_id, ddl='varchar(50)')
    email = StringField(updatable=False, ddl='varchar(50)')
    password = StringField(ddl='varchar(50)')
    admin = BooleanField()
    name = StringField(ddl='varchar(50)')
    image = StringField(ddl='varchar(500)')
    created_at = FloatField(updatable=False, default=time.time)

class Blog(Model):
    __table__ = 'blogs'

    id = StringField(primary_key=True, updatable=False, default=next_id, ddl='varchar(50)')
    user_id = StringField(updatable=False, ddl='varchar(50)')
    user_name = StringField(ddl='varchar(50)')
    user_image = StringField(ddl='varchar(500)')
    name = StringField(ddl='varchar(50)')
    summary = StringField(ddl='varchar(200)')
    content = TextField()
    created_at = FloatField(updatable=False, default=time.time)

class Comment(Model):
    __table__ = 'comments'

    id = StringField(primary_key=True, 
        default=next_id, ddl='varchar(50)', updatable=False)
    blog_id = StringField(updatable=False, ddl='varchar(50)')
    user_id = StringField(updatable=False, ddl='varchar(50)')
    user_name = StringField(ddl='varchar(50)')
    user_image = StringField(ddl='varchar(500)')
    content = TextField()
    created_at = FloatField(updatable=False, default=time.time)

class departments(Model):
    """docstring for ClassName"""
    __table__ = 'departments'

    departmentID = StringField(primary_key=True, ddl='varchar(10)',
        updatable=False)
    departmentName = StringField(ddl='varchar(50)')

class students(Model):
    """docstring for students"""
    __table__ = 'students'

    studentID = StringField(primary_key=True, 
        ddl='varchar(10)', updatable=False)
    studentName = StringField(ddl='varchar(40)', default='张三')
    studentDepartment = StringField(ddl='varchar(50)', default='信息科学技术学院')
    home = StringField(ddl='varchar(50)', default='中国')
    # grade = IntegerField(ddl='bit', default=1)
    # classes = IntegerField(ddl='bit', default=1)
    sex = IntegerField(ddl='integer', default=0)
    finished = BooleanField(default=False)
    logintime = TimeField(updatable=False,
        default=time.strftime("%Y-%m-%d %H:%M:%S", time.localtime()))

class question(Model):
    """
    """
    __table__ = 'question'

    questionID = IntegerField(primary_key=True, 
        ddl='integer', updatable=False)
    title = TextField()
    option = TextField()
    type = IntegerField(default=0, ddl='integer')
    createtime = TimeField(updatable=False,
        default=time.strftime("%Y-%m-%d %H:%M:%S", time.localtime()))
    altertime = TimeField(updatable=False,
        default=time.strftime("%Y-%m-%d %H:%M:%S", time.localtime()))
    score = IntegerField(ddl='integer')
    difficult = IntegerField(ddl='integer')
    part = IntegerField(ddl='integer')
        
class student_ques(Model):
    """"""
    __table__ = 'student_ques'

    # studentID = StringField(ddl='varchar(10)', 
    #     foreign_key=True, 
    #     reference=('students', 'studentID'))
    # questionID = IntegerField(ddl='integer', foreign_key=True, reference=('question', 'questionID'))
    # answer = StringField(ddl='varchar(500)')
    # anstime = TimeField(ddl='DateTime', updatable=False,
    #     default=time.strftime("%Y-%m-%d %H:%M:%S", time.localtime()))
    # primary_key = ('studentID', 'questionID')
    studentID = StringField(ddl='varchar(10)', 
        primary_key=True, updatable=False)
    questionID = IntegerField(ddl='integer', updatable=False)
    answer = StringField(ddl='varchar(500)')
    anstime = TimeField(ddl='DateTime', updatable=False,
        default=time.strftime("%Y-%m-%d %H:%M:%S", time.localtime()))

class log(Model):
    """"""
    __table__ = 'log'

    id = IntegerField(ddl='integer', 
        primary_key=True, auto_incre=True, updatable=False)
    time = TimeField(updatable=False,
        default=time.strftime("%Y-%m-%d %H:%M:%S", time.localtime()))
    details = TextField()

class Manager(Model):
    """"""
    __table__ = 'manager'

    id = StringField(ddl='varchar(20)', primary_key=True)
    password = StringField(ddl='varchar(40)')
        



