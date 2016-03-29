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
    tmp_dir = "/tmp/countServiceLog"
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

$4 ~ /openAndSign/ && $0 ~ /,\"newOpenFlag\":true,/{
    #统计开户人数
    countCom(OPENANDSIGN,open_arr,cellphone_field_name)         
}    

$4 ~ /openAndSign/ && $0 ~ /,\"newOpenFlag\":false,/{
    #统计签约的人数
    countCom(OPENANDSIGN,sign_arr,cellphone_field_name)         
}    


END{

    #print "login"
    print traversalDoubleArr(appLogin_arr) > tmp_dir "/" APPLOGIN
    #print "regdo"
    print traversalDoubleArr(regdo_arr) > tmp_dir "/" "reg.do"
    #print "appRelated"
    print traversalDoubleArr(appRelated_arr) > tmp_dir "/" APPRELATED
    #print "open"
    print traversalDoubleArr(open_arr) > tmp_dir "/" "open" 
    #print "sign"
    print traversalDoubleArr(sign_arr) > tmp_dir "/" "sign" 
}

#统计主方法
function countCom(service_name,service_arr,field_name){
    jsonindex_start = length(log_head_length)+1+length(service_name)
    jsonstr_length = length($0)-1-jsonindex_start
    jsonStr = substr($0,jsonindex_start,jsonstr_length)

    phone = get_json_field(jsonStr, field_name) 
    uaValue = get_json_field(jsonStr, ua_field_name)
    setUa(service_arr,uaValue,phone) 
    }

#获取json字符串的值
function get_json_field(jsonStr, field_name){
    field_index = index(jsonStr,field_name)
    afterfield_Str = substr(jsonStr,field_index)
    if(field_index != 0){
       value_index_end = index(afterfield_Str,"\",") 
       value = substr(afterfield_Str,length(field_name) + 3, value_index_end - length(field_name)-3) 
       return value
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
