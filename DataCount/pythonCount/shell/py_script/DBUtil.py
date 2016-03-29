#!/usr/bin/python
# -*- coding: UTF-8 -*-

import MySQLdb

def create_default_db(db_name):
    conn = MySQLdb.connect(host='localhost',user='root',passwd='',port=3306)
    cur = conn.cursor()
    
    createdbase_sql ='create database if not exists '+db_name
    cur.execute(createdbase_sql)

    conn.select_db(db_name)
    cur.execute(" CREATE TABLE IF NOT EXISTS usermanage_count (   id bigint(20) NOT NULL AUTO_INCREMENT,   phone char(11) NOT NULL,   count_number int(20) NOT NULL,   service_name varchar(20) NOT NULL,   count_date datetime NOT NULL,   ua varchar(10) NOT NULL,   success_flag char(1) DEFAULT 'Y',   PRIMARY KEY (id),   KEY count_date_index (service_name,count_date,success_flag,ua) ) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1")
    
    conn.commit()
    conn.close()

def get_mysql_conn(db_name):
    db = MySQLdb.connect("localhost","root","",db_name)
    return db
