#! /bin/sh
#日志文件路径
LOG_FILE_PATH=$1
#创建临时文件目录
mkdir -p tmp
#获取脚本包的位置
basepath=$(cd `dirname $0`; pwd)
basepath=$basepath/shlib

#将日志文件用awk处理生成临时统计文件
sed -f $basepath/rmspace.sed ${LOG_FILE_PATH} |awk -f countServiceLog.awk 

#将临时统计文件使用python解析入库
python do_insert.py
