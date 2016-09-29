#########################################################################
# File Name: insert_pro.sh
# Author: raoxiang
# mail: xiangrao@qilin99.com
# Created Time: 2016-05-18
#########################################################################
#!/bin/bash
mysql -u root -p -e 'source ./table_create.sql'
mysql -u root -p -e 'source ./data_insert.sql'
