#pace line
/^[ \t]*$/d
#/^[[:blank:]]*$/d
#/^ *$/d

#rm front space
s/^[ \t][ \t]*//
#s/^  *//

#change seraral to one space
#空格和制表符是不一样的
#s/  */ /g
s/[ \t][ \t]*/ /


#sed -f ./transhlib/rmspace.sed 终端快捷键 >终端快捷键_rmspace
