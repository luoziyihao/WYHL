function getlastindex(STRING, SUBSTRING){
    stringlength = length(STRING)
#由于awk里面所有的变量都是全局变量 所以在函数里面的变量必须全部自己赋初值
    newStr=""
    for(i= 0; i<stringlength ; i++){
       newStr = newStr substr(STRING,stringlength-i,1) 
        }
     j = index(newStr,SUBSTRING)
     #print newStr " " SUBSTRING
     j = length(newStr) - j + 1
     #print j
     return j
    

}


END{
   # print getlastindex("abcdefg111","g")
    }
