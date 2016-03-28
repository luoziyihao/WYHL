#! /bin/sh
#日志文件路径
LOG_FILE_PATH=$1
#获取脚本包的位置
basepath=$(cd `dirname $0`; pwd)
basepath=$basepath/shlib
#将日志文件用awk处理
sed -f $basepath/rmspace.sed ${LOG_FILE_PATH} |awk -f countServiceLog.awk |less
