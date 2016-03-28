--
-- choose database
--

use countTest

--
-- Table structure for table usermanage_count
--

CREATE TABLE IF NOT EXISTS usermanage_count (
  id bigint(20) NOT NULL AUTO_INCREMENT,
  phone char(11) NOT NULL,
  count_number int(20) NOT NULL,
  service_name varchar(20) NOT NULL,
  count_date datetime NOT NULL,
  ua varchar(10) NOT NULL,
  success_flag char(1) DEFAULT 'Y',
  PRIMARY KEY (id),
  KEY count_date_index (service_name,count_date,success_flag,ua)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;
