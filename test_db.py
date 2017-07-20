#!/usr/bin/python
# -*- coding: UTF-8 -*-
from models import departments, students, question

from transwarp import db

db.create_engine(user='root', password='123456',
 database='questionaire')
try:
	ques = question(title=u'对于本学期的文计课，你有什么期望或建议（教学内容、教学方式等）',option=u'', type=2, score=5)
	ques.insert()
except Exception, e:
	print e
try:
	ques = question(title=u'在哪里使用计算机',option=u'家里台式机;笔记本电脑;网吧;图书馆;计算中心;院系计算机房', type=1, score=5)
	ques.insert()
except Exception, e:
	print e
try:
	ques = question(title=u'使用计算机的程度是',option=u'很少使用;不熟练;还可以吧;熟练;很熟练')
	ques.insert()
except Exception, e:
	print e
# try:
# 	department = departments(departmentID='0048', departmentName='EECS')
# 	department.insert()
# except Exception, e:
# 	print e
# try:
# 	department = departments(departmentID='0049', departmentName='COE')
# 	department.insert()
# except Exception, e:
# 	print e
# d1 = departments.find_first('where departmentID=?', '0048')
# print d1.departmentName
# print d1.departmentID
# a = departments.find_all()
# print a
# print 'EECS' in a
# ques=[{'a':'b','b':'d,e,f'},{'xss':'asd','b':'as,ads,da'}]
# for x in ques:
# 	print x
# 	x['b']=x['b'].split(',')
# print ques