BEGIN{
    FS = "[\t ][\t ]*"
    log_head_length = "2016-03-28 10:26:50,006 FATAL [] - <"
    #serviceName
    APPLOGIN = "appLogin"
    REGDO= "reg\.do"
    APPRELATED = "appRelated" 
    OPENANDSIGN= "openAndSign" 
    #fieldName
    phone_field_name = "\"phone\""
    cellphone_field_name = "\"cellphone\""
    ua_field_name = "\"ua\""
}

$4 ~ /appLogin/ {
    #统计登录的人数
    countCom(APPLOGIN,appLogin_arr,phone_field_name)         
    }

$4 ~ /reg\.do/ {
    #统计注册的人数
    countCom(REGDO,regdo_arr,phone_field_name)         
}    

$4 ~ /appRelated/ {
    #统计关联微信的人数
    countCom(APPRELATED,appRelated_arr,phone_field_name)         
}    

$4 ~ /openAndSign/ {
    #统计注册的人数
    countCom(OPENANDSIGN,openAndSign_arr,cellphone_field_name)         
}    


END{

    #print "login"
    print traversalDoubleArr(appLogin_arr) > "tmp/" APPLOGIN
    #print "regdo"
    print traversalDoubleArr(regdo_arr) > "tmp/" "reg.do"
    #print "appRelated"
    print traversalDoubleArr(appRelated_arr) > "tmp/" APPRELATED
    #print "openandSign"
    print traversalDoubleArr(openAndSign_arr) > "tmp/" OPENANDSIGN
}

#统计主方法
function countCom(service_name,service_arr,field_name){
    jsonindex_start = length(log_head_length)+1+length(service_name)
    jsonstr_length = length($0)-1-jsonindex_start
    jsonStr = substr($0,jsonindex_start,jsonstr_length)
    phone_index = index(jsonStr,field_name) + length(field_name)+2
    phone = substr(jsonStr,phone_index,11)  
    
    uafield_index = index(jsonStr,ua_field_name)
    afteruaStr = substr(jsonStr,uafield_index)
    if(uafield_index != 0){
       index_ua_end = index(afteruaStr,"\",") 
       uaValue = substr(afteruaStr,length("\"ua\":\"")+1,index_ua_end - length(ua_field_name)-3) 
       setUa(service_arr,uaValue,phone) 
       }
    }

#遍历统计结果
function traversalDoubleArr(arr){
    returnstr = ""
    for(tmp in arr){
        split(tmp,array2,SUBSEP);
        returnstr = returnstr array2[1] "\t" array2[2] "\t" arr[tmp] "\n"
        }
        return returnstr
        }

#累加统计结果
function setUa(arr, uaValue,str){
    arr[uaValue,str]  = arr[uaValue,str] + 1
        }
