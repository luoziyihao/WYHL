#install_tools安装工具 setuptools-17.1.1.zip
sudo python setup.py install

#安装mysql-python的依赖
#error: unstall_config can't find
sudo apt-get install libmysqlclient-dev
sudo updatedb
locate mysql_config	

#error: Setup script exited with error: command 'gcc' failed with exit status 1
sudo apt-get install python-dev

#安装mysql-python   MySQL-python-1.2.5.zip
sudo python setup.py install

#定时器
crontab -e

sudo service cron restart
