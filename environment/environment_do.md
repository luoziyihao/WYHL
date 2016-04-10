# 我盈互联环境配置

1,基础 ide环境

2,maven命令导入包

mvn install:install-file -Dfile=jar包的位置 -DgroupId=上面的groupId -DartifactId=上面的artifactId -Dversion=上面的version -Dpackaging=jar

mvn install:install-file -Dfile=/home/luoziyihao/Documents/rely_lib/jar-lib/jp-sourceforge-qrcode.jar -DgroupId=jp.sourceforge.qrcode -DartifactId=jp-sourceforge-qrcode -Dversion=1.0.0 -Dpackaging=jar
mvn install:install-file -Dfile=/home/luoziyihao/Documents/rely_lib/jar-lib/com-swetake-util.jar -DgroupId=com.swetake.util -DartifactId=com-swetake-util -Dversion=1.0.0 -Dpackaging=jar

mvn install:install-file -Dfile=/home/luoziyihao/Documents/rely_lib/jar-lib/QRCode.jar -DgroupId=jp.sourceforge.qrcode -DartifactId=jp-sourceforge-qrcode -Dversion=1.0.0 -Dpackaging=jar
mvn install:install-file -Dfile=/home/luoziyihao/Documents/rely_lib/jar-lib/swetake.jar -DgroupId=com.swetake.util -DartifactId=com-swetake-util -Dversion=1.0.0 -Dpackaging=jar


3,tomcat验证, mysql创建


4,导入数据

先删掉数据库
再导入数据
mysql -u root -p ctrade <~/ctrade.back.sql 
1,maven依赖
2,项目依赖
两者是不一样的
