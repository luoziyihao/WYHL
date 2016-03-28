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


select distinct date from live_msg order by date desc limit 0,1

--date_format(date,'%Y-%m-%d')    -------------->oracle中的to_char();
--str_to_date(date,'%Y-%m-%d')     -------------->oracle中的to_date();

select str_to_date('08/09/2008', '%m/%d/%Y'); -- 2008-08-09
select str_to_date('08/09/08' , '%m/%d/%y'); -- 2008-08-09
select str_to_date('08.09.2008', '%m.%d.%Y'); -- 2008-08-09
select str_to_date('08:09:30', '%h:%i:%s'); -- 08:09:30
select str_to_date('08.09.2008 08:09:30', '%m.%d.%Y %h:%i:%s'); -- 2008-08-09 08:09:30

delete from live_msg where live_msg.date = str_to_date('2016-01-15 03:07:18', '%m-%d-%Y %h:%i:%s');
