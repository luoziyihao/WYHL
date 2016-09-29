/* 新用户未领取体验金 */
select `customerName` ,`customerNo` ,`cellphone`,`openDate`   from `member_account` WHERE `openDate` >= '2016-05-01 00:00:00' and `openDate` <='2016-05-31 23:59:59' and `openReward` = 1

/* 老用户没充值送金 */
select `customerName` ,`customerNo` ,`cellphone`,`openDate`   from `member_account` WHERE `openDate` <  '2016-05-01 00:00:00' and `customerNo`  not in (select `customerNo` from `system_reward_history` where DATE >='2016-05-01 00:00:00' and DATE <='2016-05-31 23:59:59' and type='sc0002' and STATUS =1 )

/********* 已交易用户提升 START *************/

/*SET @START_DATE='2016-03-01 00:00:00';
SET @END_DATE='2016-05-01 00:00:00';*/
SET @START_DATE='2016-05-01 00:00:00';
SET @END_DATE='2016-06-01 00:00:00';
SET @WUBAI_001='wubai';
SET @WUBAI_002='wubai001';
SET @WUBAI_003='500_01';

DROP TEMPORARY TABLE  IF EXISTS tmp_report_user;
DROP TEMPORARY TABLE  IF EXISTS tmp_report_account;
DROP TEMPORARY TABLE  IF EXISTS tmp_report_income; 
DROP TEMPORARY TABLE  IF EXISTS tmp_report_trade; 
/* 注册 */
CREATE TEMPORARY TABLE IF NOT EXISTS  tmp_report_user
SELECT a.`phone`,b.`customerName` ,b.`customerNo`,a.`channel` as channel_reg,b.`channel` as channel_open,b.`isQuickPay`   
FROM `member_user` a LEFT JOIN `member_account` b 
ON a.`id` = b.`userId`  
WHERE a.`regDate` >=@START_DATE and a.`regDate` <@END_DATE;
/* 开户 */
CREATE TEMPORARY TABLE IF NOT EXISTS  tmp_report_account
SELECT a.`phone`,b.`customerName` ,b.`customerNo`,a.`channel` as channel_reg,b.`channel` as channel_open,b.`isQuickPay`   
FROM `member_user` a LEFT JOIN `member_account` b 
ON a.`id` = b.`userId`  
WHERE b.`openDate` >=@START_DATE and b.`openDate` <@END_DATE;
/* 入金 */
CREATE TEMPORARY TABLE IF NOT EXISTS  tmp_report_income
SELECT a.*,b.`customerName` ,b.`channel`   FROM 
(SELECT `am` ,`fi_i` ,COUNT(1) as income_count,SUM(`am`)  AS income_sum FROM `report_fundio_history` WHERE `ut` >=@START_DATE AND `ut` <@END_DATE AND `tt` ='I'  GROUP BY `fi_i` ) a LEFT JOIN `member_account` b 
ON a.`fi_i`=b.`customerNo`;
/* 交易 */
CREATE TEMPORARY TABLE IF NOT EXISTS  tmp_report_trade
SELECT 
CASE `co_i` WHEN 'DLAG200G'  THEN 20  WHEN 'DLAG100G' THEN  10 WHEN 'DLAG50G' THEN  5 WHEN 'DZO200kg' THEN 20 WHEN 'DZO100kg' THEN 10 WHEN 'DZO50kg' THEN 5 END AS power,
(CASE `co_i` WHEN 'DLAG200G'  THEN 20  WHEN 'DLAG100G' THEN  10 WHEN 'DLAG50G' THEN  5 WHEN 'DZO200kg' THEN 20 WHEN 'DZO100kg' THEN 10 WHEN 'DZO50kg' THEN 5 END)*`pr` * `qty`  AS pr_sum,
`fi_i`,`co_i`,`pr`,`qty`,`comm` 
FROM `report_trade_history` WHERE `ti` >=@START_DATE AND `ti` <@END_DATE;

SELECT * from tmp_report_user;
SELECT * from tmp_report_account;
SELECT * FROM tmp_report_income;
SELECT * FROM tmp_report_trade;

select * from tmp_report_account WHERE channel_reg in (@WUBAI_001,@WUBAI_002,@WUBAI_003) and customerNo is not null;
select * from tmp_report_account WHERE channel_reg in (@WUBAI_001,@WUBAI_002,@WUBAI_003) and customerNo is not null and isQuickPay=1;
select * from tmp_report_income WHERE fi_i in (select customerNo from tmp_report_account where customerNo is not null) and  channel in (@WUBAI_001,@WUBAI_002,@WUBAI_003);
select COUNT(1) as c,sum(pr_sum) as pr_sum_total,sum(comm) as comm_sum,sum(qty) as qty_sum from tmp_report_trade WHERE fi_i in (select customerNo from tmp_report_account where customerNo is not null) and fi_i in (select fi_i from tmp_report_income);



/* 注册,开户,快捷,交易 */
SET @START_DATE='2016-06-01 06:00:00';
SET @END_DATE='2016-07-01 04:00:00';
/** 注册 **/
select `phone` from `member_user` WHERE `regDate` >=@START_DATE and `regDate` <=@END_DATE;
/** 开户 **/
SELECT `cellphone`,`customerName`,`customerNo`  from `member_account` WHERE `openDate`  >=@START_DATE and `openDate` <=@END_DATE 
and `userId` IN (select id from `member_user` WHERE `regDate` >=@START_DATE and `regDate` <=@END_DATE);
/** 快捷 **/
SELECT `cellphone`,`customerName`,`customerNo` from `member_account` WHERE `openDate`  >=@START_DATE and `openDate` <=@END_DATE and `isQuickPay` =1
and `userId` IN (select id from `member_user` WHERE `regDate` >=@START_DATE and `regDate` <=@END_DATE);
/** 入金 **/
SELECT `cellphone`,`customerName`,`customerNo` from `member_account` WHERE `openDate`  >=@START_DATE and `openDate` <=@END_DATE and `isQuickPay` =1 
and `userId` IN (select id from `member_user` WHERE `regDate` >=@START_DATE and `regDate` <=@END_DATE)
and (`customerNo` IN (SELECT DISTINCT(fi_i) from `report_fundio` WHERE ut>=@START_DATE and ut<@END_DATE) or `customerNo` IN (SELECT DISTINCT(fi_i) from `report_fundio_history` WHERE ut>=@START_DATE and ut<@END_DATE));
/** 交易 **/
SELECT `cellphone`,`customerName`,`customerNo` from `member_account` WHERE `openDate`  >=@START_DATE and `openDate` <=@END_DATE and `isQuickPay` =1
and `userId` IN (select id from `member_user` WHERE `regDate` >=@START_DATE and `regDate` <=@END_DATE)
and (`customerNo` IN (SELECT DISTINCT(fi_i) from `report_fundio` WHERE ut>=@START_DATE and ut<@END_DATE) or `customerNo` IN (SELECT DISTINCT(fi_i) from `report_fundio_history` WHERE ut>=@START_DATE and ut<@END_DATE))
and `customerNo` IN (SELECT DISTINCT(`customerNo`) from `report_trade_all` WHERE ti>=@START_DATE and ti<@END_DATE);



/********* 已交易用户提升 END ************/


/********* 查看交易流水 **********/
SELECT 
CASE `co_i` WHEN 'DLAG200G'  THEN 20  WHEN 'DLAG100G' THEN  10 WHEN 'DLAG50G' THEN  5 WHEN 'DZO200kg' THEN 20 WHEN 'DZO100kg' THEN 10 WHEN 'DZO50kg' THEN 5 ELSE 0 END AS power,
(CASE `co_i` WHEN 'DLAG200G'  THEN 20  WHEN 'DLAG100G' THEN  10 WHEN 'DLAG50G' THEN  5 WHEN 'DZO200kg' THEN 20 WHEN 'DZO100kg' THEN 10 WHEN 'DZO50kg' THEN 5 ELSE 0 END)*`pr` * `qty`  AS pr_sum,
`fi_i`,`co_i`,`pr`,`qty`,`comm` , `ti` ,  `tr_i` ,  `tr_n` ,  `or_n` ,  `liqpl` ,  `hl_n` ,  `tr_t` ,  `o_pr` ,  `h_p` ,  `other_id` ,  `or_t` ,  `ty` ,  `se_f` ,  `environmentcode` 
FROM (select * from report_trade_history union all (select * from report_trade where ti>(select ti from report_trade_history order by ti desc limit 1))) t_all WHERE `ti` >='2016-03-01 00:00:00';





/* 活动奖金流水 */
select SUM(`amount`) as '金额',`type`,
case  
when type='open' then '开户送金' 
when type='cms_paybonuses' then '后台发奖金' when type='dzp0001' then '交易抽奖5.23-5.28' 
when type='jyph0001' then '麒麟金榜5.9-5.13' when type='sc0001' then '四月首充送金' when type='sc0002' then '五月首充送金' 
when type='sqrpx' then '社群日排行'  when type='sqyq' then '社群邀请'  
when type='paybonuses_withdraw' then '后台发奖金回收' when type='sc0001_withdraw' then '四月首充送金回收' when type='sc0002_withdraw' then '五月首充送金'
end as '类型'  
from `system_reward_history` WHERE  `status` =1  GROUP BY `type` ;
select sum(amount) from `system_reward_history` WHERE type='open' and date>='2016-04-01 00:00:00' and date<'2016-05-01 00:00:00' and `status` =1  GROUP BY `type`;
select sum(amount) from `system_reward_history` WHERE type='open' and date>='2016-05-01 00:00:00' and date<'2016-06-01 00:00:00' and `status` =1  GROUP BY `type`;


/* 抽奖资格未用完 */
select a.`amount` ,a.`customerNo` ,a.`giftCount`,a.`tradesCount` ,b.`customerName` ,b.`cellphone`  from `member_usergift` a left join `member_account`  b  on a.`customerNo` =b.`customerNo`  WHERE a.`rewardCode` ='dzp0002' and a.`giftCount` >0 and a.`giftCount`>a.`tradesCount`

/* 统计交易 */
select sum(`pr_sum`) as 总成交额,SUM(`qty`) as 总成交手数,count(1) as 总成交次数,SUM(`comm`) as 总手续费  from `report_trade_all`  WHERE `ti` >='2016-06-23 06:00:00' and  `ti` <='2016-06-24 04:00:00'

/* 当日入金 */
SELECT sum(`am` ) as 入金 from `report_fundio_all` WHERE `ut` >='2016-07-04 06:00:00' and  `ut` <='2016-07-05 04:00:00' and `am`>0;
SELECT sum(`am` ) as 出金 from `report_fundio_all` WHERE `ut` >='2016-07-04 06:00:00' and  `ut` <='2016-07-05 04:00:00' and `am`<0;
SELECT sum(`am` ) as 净入金 from `report_fundio_all` WHERE `ut` >='2016-07-04 06:00:00' and  `ut` <='2016-07-05 04:00:00';

/* 统计已开快捷用户 */
SELECT  t_mc.`openDate`  as 开户时间,t_mc.`paperCode` as 身份证,t_mc.`customerName` as 客户名称,t_mc.`customerNo` as 资金账号,t_mu.`lastLoginDate` as 最后登录时间,t_mu.`regDate` as 注册时间,
case left(t_mc.`paperCode`, 2) 
when '11' then '北京市'
when '12' then '天津市'
when '13' then '河北省'
when '14' then '山西省'
when '15' then '内蒙古自治区'
when '21' then '辽宁省'
when '22' then '吉林省'
when '23' then '黑龙江省'
when '31' then '上海市'
when '32' then '江苏省'
when '33' then '浙江省'
when '34' then '安徽省'
when '35' then '福建省'
when '36' then '江西省'
when '37' then '山东省'
when '41' then '河南省'
when '42' then '湖北省'
when '43' then '湖南省'
when '44' then '广东省'
when '45' then '广西壮族自治区'
when '46' then '海南省'
when '50' then '重庆市'
when '51' then '四川省'
when '52' then '贵州省'
when '53' then '云南省'
when '54' then '西藏自治区'
when '61' then '陕西省'
when '62' then '甘肃省'
when '63' then '青海省'
when '64' then '宁夏回族自治区'
when '65' then '新疆维吾尔自治区'
when '71' then '台湾省'
when '81' then '香港特别行政区'
when '82' then '澳门特别行政区'
else '未知'     
end   as 省份,
year(curdate())-if(length(t_mc.`paperCode`)= 18,substring(t_mc.`paperCode`,7,4),if(length(t_mc.`paperCode`)=15,concat('19',substring(t_mc.`paperCode`,7,2)),null)) as 年龄,
case if(length(t_mc.`paperCode`)=18, cast(substring(t_mc.`paperCode`,17,1) as UNSIGNED)%2, if(length(t_mc.`paperCode`)=15,cast(substring(t_mc.`paperCode`,15,1) as UNSIGNED)%2,3)) 
when 1 then '男'
when 0 then '女'
else '未知'
end as 性别,
ifnull(t_rta.`pr_sum`, 0) as 交易额,
ifnull(t_rta.`qty`, 0) as 交易手数,
ifnull(t_rta.`comm`, 0) as 手续费,
ifnull(t_rta.trade_count, 0) as 交易次数
FROM `member_account` t_mc 
LEFT JOIN `member_user` t_mu 
ON t_mc.`userId` = t_mu.`id` 
LEFT JOIN 
(SELECT 
`fi_i` as fi_i,
round(sum(`pr_sum`), 2) as pr_sum,
sum(`qty`) as qty,
round(sum(`comm`), 2) as comm,
count(1) as trade_count
FROM `report_trade_all` WHERE  `ti` >='2016-06-01 06:00:00' and `ti` <'2016-07-01 04:00:00'
GROUP BY `fi_i`
) t_rta
ON t_mc.`customerNo` = t_rta.`fi_i` 
WHERE t_mc.`isQuickPay` = 1
ORDER BY t_mc.`id` ;


/*活动期间客户交易额*/
select sum(a.`pr_sum`) as 总成交额,SUM(a.`qty`) as 总成交手数,count(1) as 总成交次数,b.`customerName` ,b.`customerNo` ,b.`cellphone`   from `report_trade_all` a left join `member_account`  b  on a.`fi_i`  =b.`customerNo`  WHERE a.`ti` >='2016-07-12 12:00:00' and  a.`ti` <='2016-07-16 04:00:00' GROUP BY a.`fi_i`;


/*大转盘统计-参与抽奖用户的交易手数及入金*/
select sum(`pr_sum`) as 总成交额,SUM(`qty`) as 总成交手数,count(1) as 总成交次数,sum(`comm` ) as 总手续费 from `report_trade_all`  WHERE `ti` >='2016-05-23 06:00:00' and  `ti` <='2016-05-28 04:00:00' and `fi_i` IN (SELECT `customerNo`  FROM `member_usergift` WHERE `rewardCode` ='dzp0001' and tradesCount>0);
select sum(`am`) as 总出入金 from `report_fundio_all`  WHERE `ut` >='2016-05-23 06:00:00' and  `ut` <='2016-05-28 04:00:00' and `fi_i` IN (SELECT `customerNo`  FROM `member_usergift` WHERE `rewardCode` ='dzp0001' and tradesCount>0) and am>0;


/*活动期间-参与用户的交易及入金*/
select sum(`pr_sum`) as 总成交额,SUM(`qty`) as 总成交手数,count(1) as 总成交次数,sum(`comm` ) as 总手续费 from `report_trade_all`  WHERE `ti` >='2016-05-09 06:00:00' and  `ti` <='2016-05-14 04:00:00' and `fi_i` IN (SELECT `customerNo`  FROM `system_reward_history` WHERE `type` ='jyph0001');
select sum(`am`) as 总出入金 from `report_fundio_all`  WHERE `ut` >='2016-05-09 06:00:00' and  `ut` <='2016-05-14 04:00:00' and `fi_i` IN (SELECT `customerNo`  FROM `system_reward_history` WHERE `type` ='jyph0001') and am>0;


/*客户生命周期分析表*/
/*
customerName-客户姓名;phone_reg-注册手机号;phone_open-开户手机号;customerNo-客户账号;is_open-是否开户;regDate-注册日期;openDate-开户日期;isQuickPay-是否开通快捷;channel_reg-注册渠道;channel_open-开户渠道;
lastLoginDate-最后登录日期;is_transfer-是否入金;ut_min-第一次入金时间;am_total-出入金净额;pr_sum_max-最大交易额;ti_max-最近一次交易时间;comm_total-总手续费;
capital-指定某天的期末权益
*/
SELECT m_u.`id`,m_a.`customerName`,m_u.`phone` as phong_reg ,m_a.`cellphone` as phone_open,m_a.`customerNo`,if(m_a.`customerNo` is null,0,1) as is_open,m_u.`regDate`,m_a.`openDate`,
m_a.`isQuickPay`,m_u.`channel` as channel_reg,m_a.`channel` as channel_open,m_u.`lastLoginDate`,
if(t_rfa.ut_min is null,0,1) as is_transfer,t_rfa.ut_min,t_rfa.am_total,
t_rta.pr_sum_max,t_rta.ti_max,t_rta.comm_total,
t_rcfs.capital
from `member_user` m_u 
LEFT JOIN `member_account` m_a 
ON m_u.`id` = m_a.`userId` 
LEFT JOIN (SELECT `fi_i` ,SUM(`am`)  AS am_total,COUNT(1) AS am_count,min(ut) AS ut_min FROM `report_fundio_all` GROUP BY `fi_i` ) t_rfa 
ON m_a.`customerNo` = t_rfa.fi_i
LEFT JOIN (SELECT `fi_i`,SUM(`comm`) AS comm_total,max(pr_sum) as pr_sum_max,sum(pr_sum) as pr_sum_total,min(ti) as ti_min,max(ti) as ti_max FROM `report_trade_all` GROUP BY `fi_i` ) t_rta
ON m_a.`customerNo` = t_rta.fi_i
LEFT JOIN (SELECT `CAPITAL`,`customerNo`  from `report_customer_funds_stat` WHERE `CLEAR_DATE` ='2016-07-29 00:00:00') t_rcfs
ON m_a.`customerNo` = t_rcfs.customerNo

 
/*5月1号以后有交易行为的客户*/
SELECT m_a.`cellphone`  FROM (SELECT `fi_i`  from `report_trade_all` WHERE `ti` >="2016-05-01 00:00:00" GROUP BY `fi_i` ) t_rta LEFT JOIN `member_account` m_a ON m_a.`customerNo` = t_rta.fi_i


/*新老用户参与活动情况：新老用户交易（白银200g和汽油200kg）人数和额度*/
SELECT sum(pr_sum) from `report_trade_all` WHERE (`co_i` = 'DLAG200G' or `co_i` = 'DZO200kg') and `fi_i` IN (SELECT customerNo FROM `member_account` WHERE opendate>'2016-07-08 06:00:00') and `ti` >='2016-07-18 10:00:00' and `ti`<='2016-07-27 04:00:00';
SELECT count(1) from (SELECT fi_i from `report_trade_all` WHERE (`co_i` = 'DLAG200G' or `co_i` = 'DZO200kg') and `fi_i` IN (SELECT customerNo FROM `member_account` WHERE opendate>'2016-07-08 06:00:00') and `ti` >='2016-07-18 10:00:00' and `ti`<='2016-07-27 04:00:00' GROUP BY `fi_i` ) tmp;


/*客户入金与交易额报表*/
SELECT t_trade.*,t_fundio.am_3,t_fundio.am_4,t_fundio.am_5,t_fundio.am_6,t_fundio.am_7,t_fundio.am_8 FROM
(
SELECT `customerName` , `cellphone` , MAX(trade_3) trade_3, MAX(trade_4) trade_4, MAX(trade_5) trade_5, MAX(trade_6) trade_6, MAX(trade_7) trade_7, MAX(trade_8) trade_8 from(
SELECT  m_a.id,m_a.`customerName`,m_a.`cellphone`,t_rta.month,t_rta.pr_sum_total,
case month when 3 then pr_sum_total else 0 end trade_3,
case month when 4 then pr_sum_total else 0 end trade_4,
case month when 5 then pr_sum_total else 0 end trade_5,
case month when 6 then pr_sum_total else 0 end trade_6,
case month when 7 then pr_sum_total else 0 end trade_7,
case month when 8 then pr_sum_total else 0 end trade_8
from `member_account` m_a LEFT JOIN (SELECT fi_i,DATE_FORMAT(ti,"%c") as month,concat(fi_i,DATE_FORMAT(ti,"_%Y%c")) as groupstr,sum(pr_sum) as pr_sum_total FROM `report_trade_all` GROUP BY groupstr order by `fi_i`) t_rta ON m_a.`customerNo` =t_rta.fi_i
) tmp GROUP BY `customerName` order by id
) t_trade
LEFT JOIN 
(
SELECT `customerName` , `cellphone` , MAX(am_3) am_3, MAX(am_4) am_4, MAX(am_5) am_5, MAX(am_6) am_6, MAX(am_7) am_7, MAX(am_8) am_8 from(
SELECT  m_a.id,m_a.`customerName`,m_a.`cellphone`,t_rfa.month,t_rfa.am_total,
case month when 3 then am_total else 0 end am_3,
case month when 4 then am_total else 0 end am_4,
case month when 5 then am_total else 0 end am_5,
case month when 6 then am_total else 0 end am_6,
case month when 7 then am_total else 0 end am_7,
case month when 8 then am_total else 0 end am_8
from `member_account` m_a LEFT JOIN (SELECT fi_i,DATE_FORMAT(ut,"%c") as month,concat(fi_i,DATE_FORMAT(ut,"_%Y%c")) as groupstr,sum(am) as am_total FROM `report_fundio_all` GROUP BY groupstr order by `fi_i`) t_rfa ON m_a.`customerNo` =t_rfa.fi_i
) tmp GROUP BY `customerName`  order by id
) t_fundio
ON t_trade.customerName=t_fundio.customerName
/*交易*/
SELECT `customerName` , `cellphone` , MAX(trade_3) trade_3, MAX(trade_4) trade_4, MAX(trade_5) trade_5, MAX(trade_6) trade_6, MAX(trade_7) trade_7, MAX(trade_8) trade_8 from(
SELECT  m_a.id,m_a.`customerName`,m_a.`cellphone`,t_rta.month,t_rta.pr_sum_total,
case month when 3 then pr_sum_total else 0 end trade_3,
case month when 4 then pr_sum_total else 0 end trade_4,
case month when 5 then pr_sum_total else 0 end trade_5,
case month when 6 then pr_sum_total else 0 end trade_6,
case month when 7 then pr_sum_total else 0 end trade_7,
case month when 8 then pr_sum_total else 0 end trade_8
from `member_account` m_a LEFT JOIN (SELECT fi_i,DATE_FORMAT(ti,"%c") as month,concat(fi_i,DATE_FORMAT(ti,"_%Y%c")) as groupstr,sum(pr_sum) as pr_sum_total FROM `report_trade_all` GROUP BY groupstr order by `fi_i`) t_rta ON m_a.`customerNo` =t_rta.fi_i
) tmp GROUP BY `customerName` order by id;
/*入金*/
SELECT `customerName` , `cellphone` , MAX(am_3) am_3, MAX(am_4) am_4, MAX(am_5) am_5, MAX(am_6) am_6, MAX(am_7) am_7, MAX(am_8) am_8 from(
SELECT  m_a.id,m_a.`customerName`,m_a.`cellphone`,t_rfa.month,t_rfa.am_total,
case month when 3 then am_total else 0 end am_3,
case month when 4 then am_total else 0 end am_4,
case month when 5 then am_total else 0 end am_5,
case month when 6 then am_total else 0 end am_6,
case month when 7 then am_total else 0 end am_7,
case month when 8 then am_total else 0 end am_8
from `member_account` m_a LEFT JOIN (SELECT fi_i,DATE_FORMAT(ut,"%c") as month,concat(fi_i,DATE_FORMAT(ut,"_%Y%c")) as groupstr,sum(am) as am_total FROM `report_fundio_all` GROUP BY groupstr order by `fi_i`) t_rfa ON m_a.`customerNo` =t_rfa.fi_i
) tmp GROUP BY `customerName`  order by id;



