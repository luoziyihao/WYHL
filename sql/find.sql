select live_msg.id,live_msg.content,live_msg.date,ip,live_msg.title,live_msg.roomId
from
live_msg,
(select max(date) maxdate from live_msg) max_msg
where live_msg.date = max_msg.maxdate
;

--select live_msg.id,live_msg.content,live_msg.date,ip,live_msg.title,live_msg.roomId
--from
--live_msg
--where live_msg.date in (select distinct date from live_msg order by date desc limit 1,2);

select live_msg.id,live_msg.content,live_msg.date,ip,live_msg.title,live_msg.roomId
from
live_msg,
(select distinct date from live_msg order by date desc limit 0,2) maxdate_live_msg
where live_msg.date = maxdate_live_msg.date;


--
select live_msg.id,live_msg.content,live_msg.date,ip,live_msg.title,live_msg.roomId
from
live_msg,
(select distinct date_format(date,'%Y-%m-%d') perdate from live_msg order by date desc limit 0,2) maxdate_live_msg
where date_format(live_msg.date,'%Y-%m-%d') = maxdate_live_msg.perdate
order by live_msg.date 
;


select max(date) from live_msg;
select distinct date from live_msg order by date desc limit 0,1
select max(ti) lastdate from report_trade;
select distinct ti from trade_report order by date desc limit 0,1

--date_format(date,'%Y-%m-%d')    -------------->oracle中的to_char();
--str_to_date(date,'%Y-%m-%d')     -------------->oracle中的to_date();

select str_to_date('08/09/2008', '%m/%d/%Y'); -- 2008-08-09
select str_to_date('08/09/08' , '%m/%d/%y'); -- 2008-08-09
select str_to_date('08.09.2008', '%m.%d.%Y'); -- 2008-08-09
select str_to_date('08:09:30', '%h:%i:%s'); -- 08:09:30
select str_to_date('08.09.2008 08:09:30', '%m.%d.%Y %h:%i:%s'); -- 2008-08-09 08:09:30

delete from live_msg where live_msg.date = str_to_date('2016-01-15 03:07:18', '%m-%d-%Y %h:%i:%s');

----------------------------------------------------------------------------------------------------
-----------------------------SQLObject test for service_count start --------------------------------
----------------------------------------------------------------------------------------------------
--获取昨日所有交易的总人数
select count(phone), ua, service_name from count_usermanage where date_sub(curdate(),interval 1 day) = date_format(count_date, '%Y-%m-%d') group by ua,service_name ;
select count(phone) count, service_name from (select distinct phone,service_name from count_usermanage) a group by service_name ;

--导出mysql
--mysqldump -h localhost -uroot -d ctrade count_usermanage count_trade  > count.sql
--生成Python
--sqlacodegen mysql://root:''@localhost/ctrade > sqlacodegen_ctrade.py
-- DATE_SUB(CURDATE(), INTERVAL 1 DAY)
--修该历史交易供数据测试
update report_trade_history set ti = DATE_SUB(CURDATE(), INTERVAL 1 DAY) where date_format(ti,'%Y-%m-%d') = '2016-04-23';
--update report_trade_history set ti = '2016-05-16 15:42:58' where date_format(ti) = date_format(DATE_SUB(CURDATE(), INTERVAL 1 DAY))
----------------------------------------------------------------------------------------------------
-----------------------------SQLObject test for service_count end-----------------------------------
----------------------------------------------------------------------------------------------------
