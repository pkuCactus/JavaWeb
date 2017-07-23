drop database if exists questionaire;

create database questionaire;
use questionaire;

grant select, insert, update, delete \
  on questionaire.* to 'root'@'localhost' \
  identified by '123456';


drop table if exists students;
create table students (
  `studentID` varchar(10) primary key,
  `studentName` varchar(40) not null,
  `studentDepartment` varchar(50) not null,
  `home` varchar(50) not null,
  `sex` integer not null,
  `score` integer not null default 0,
  `finished` boolean default 0,
  `logintime` DateTime not null default current_timestamp
)engine=innodb default charset=utf8;

drop table if exists departments;
create table departments (
  departmentID varchar(10) primary key,
  departmentName varchar(50) not null
)engine=innodb default charset=utf8;

drop table if exists question;
create table question(
  questionID integer primary key auto_increment,
  title text not null,
  `option` text not null,
  `type` integer not null default 0,
  `createtime` DateTime not null default current_timestamp,
  `altertime` DateTime not null default current_timestamp,
  `right_ans` varchar(100) not null default '',
  score integer,
  difficult integer,
  part integer
)engine=innodb default charset=utf8;

drop table if exists student_ques;
create table student_ques (
  studentID varchar(10),
  foreign key(studentID) references students(studentID),
  questionID integer,
  foreign key(questionID) references question(questionID),
  primary key(studentID, questionID),
  answer varchar(500),
  anstime DateTime default current_timestamp
)engine=innodb default charset=utf8;

drop table if exists log;
create table log (
  id integer primary key auto_increment,
  `time` DateTime default current_timestamp,
  details text not null
)engine=innodb default charset=utf8;

drop table if exists manager;
create table manager (
  id varchar(20) primary key,
  password varchar(40) not null
)engine=innodb default charset=utf8;

insert into manager(id, password) value('root', 'e10adc3949ba59abbe56e057f20f883e');
