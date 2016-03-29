#! /bin/sh
#统计用户登陆注册等情况
#日志文件路径
LOG_FILE_PATH=$1
LOG_FILE_DIR="/home/luoziyihao/Documents/WYHL/DataCount/pythonCount/shell"
LOG_FILE_NAME="ctrade_statistics.log"
YESTERDAY=$(date -d "1 days ago" +%Y-%m-%d)
LOG_FILE_PATH=$LOG_FILE_DIR/$LOG_FILE_NAME"."$YESTERDAY

#脚本执行环境准备
#创建临时文件目录
mkdir -p /tmp/countServiceLog

#获取脚本包的位置
basepath=$(cd `dirname $0`; pwd)
shell_lib=$basepath/shlib
py_script=$basepath/py_script

#将日志文件用awk处理生成临时统计文件
sed -f $shell_lib/rmspace.sed ${LOG_FILE_PATH} |awk -f $shell_lib/countServiceLog.awk 

#将临时统计文件使用python解析入库
python $py_script/do_insert.py

#删除备份目录
rm -rf ./tmp
