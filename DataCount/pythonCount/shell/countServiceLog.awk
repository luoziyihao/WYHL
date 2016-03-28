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

    ua_field_value = ""
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
    print "login"
    traversalArr(appLogin_arr)
    print "regdo"
    traversalArr(regdo_arr)
    print "appRelated"
    traversalArr(appRelated_arr)
    print "openandSign"
    traversalArr(openAndSign_arr)
}

function countCom(service_name,service_arr,field_name){
    jsonindex_start = length(log_head_length)+1+length(service_name)
    jsonstr_length = length($0)-1-jsonindex_start
    jsonStr = substr($0,jsonindex_start,jsonstr_length)
    phone_index = index(jsonStr,field_name) + length(field_name)+2
    phone = substr(jsonStr,phone_index,11)  
    service_arr[phone] = service_arr[phone] + 1
    print service_arr[phone]
    }

function traversalArr(arr){
    for (tmp in arr){
        print tmp " " arr[tmp]
        }
    }
