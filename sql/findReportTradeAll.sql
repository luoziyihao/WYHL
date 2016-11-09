
SELECT distinct fi_i , environmentCode FROM report_trade_all rta     WHERE EXISTS     (select 1  FROM system_activity_join saj WHERE rta.environmentCode = saj.environmentCode AND rta.fi_i = saj.customerNo)  ;


select distinct rth.fi_i customerNo, rth.environmentCode from report_trade_history rth inner join system_activity_join saj on  rth.environmentCode = saj.environmentCode and rth.fi_i = saj.customerNo;


