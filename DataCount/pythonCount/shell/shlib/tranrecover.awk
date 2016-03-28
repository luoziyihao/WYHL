BEGIN{
    FS = "[\t ]"
    }

$1 ~ /rm/ {
    #备份文件的服务器路径
    rm_sh = $0
    if(index(rm_sh,".class") > 0){
        if(index(rm_sh,"Cmp") > 0){
           cmp_class_rm_sh=cmp_class_rm_sh  rm_sh "\n" 
           componentcount++ 
           if(componentcount % 10 == 0){
               cmp_class_rm_sh = cmp_class_rm_sh "\n" 
               }
         }else if(index(rm_sh,"Dao") > 0 || index(rm_sh,"DAO") > 0){
           dao_class_rm_sh=dao_class_rm_sh  rm_sh "\n" 
           daocount++ 
           if(daocount % 10 == 0){
               dao_class_rm_sh = dao_class_rm_sh "\n" 
               }
         }else if(index(rm_sh,"Flw") > 0 || index(rm_sh,"Flow") > 0){
           flw_class_rm_sh=flw_class_rm_sh  rm_sh "\n" 
           flwcount++ 
           if(flwcount % 10 == 0){
               flw_class_rm_sh = flw_class_rm_sh "\n"
               }
         }else if(index(rm_sh,"Bean") > 0){
           bean_class_rm_sh=bean_class_rm_sh  rm_sh "\n" 
           beancount++ 
           if(beancount % 10 == 0){
               bean_class_rm_sh = bean_class_rm_sh "\n"
               }
         }else if(index(rm_sh,"Biz") > 0){
           biz_class_rm_sh=biz_class_rm_sh  rm_sh "\n" 
           bizcount++ 
           if(bizcount % 10 == 0){
               biz_class_rm_sh = biz_class_rm_sh "\n"
               }
         }else if(index(rm_sh,"Constant") > 0){
           constant_class_rm_sh=constant_class_rm_sh  rm_sh "\n" 
           constantcount++ 
           if(constantcount % 10 == 0){
               constant_class_rm_sh = constant_class_rm_sh "\n"
               }
         }else {
           other_class_rm_sh=other_class_rm_sh  rm_sh "\n" 
           othercount++ 
           if(othercount % 10 == 0){
               other_class_rm_sh = other_class_rm_sh "\n"
               }
         }
    }
    else if(index(rm_sh,".xml") > 0 || index(rm_sh,".XML") > 0){
        #xml_rm_sh=xml_rm_sh  rm_sh "\n" 
        if(index(rm_sh,"Flw") > 0){
           flw_xml_rm_sh=flw_xml_rm_sh  rm_sh "\n" 
           flwxmlcount++ 
           if(flwxmlcount % 10 == 0){
               flw_xml_rm_sh = flw_xml_rm_sh "\n" 
               }
         }else if(index(rm_sh,"request") > 0 ){
           request_xml_rm_sh=request_xml_rm_sh  rm_sh "\n" 
           requestcount++ 
           if(requestcount % 10 == 0){
               request_xml_rm_sh = request_xml_rm_sh "\n" 
               }
         }else if(index(rm_sh,"response") > 0 ){
           response_xml_rm_sh=response_xml_rm_sh  rm_sh "\n" 
           responsecount++ 
           if(responsecount % 10 == 0){
               response_xml_rm_sh = response_xml_rm_sh "\n" 
               }
        }else{
           other_xml_rm_sh=other_xml_rm_sh  rm_sh "\n" 
           otherxmlcount++ 
           if(otherxmlcount % 10 == 0){
               other_xml_rm_sh = other_xml_rm_sh "\n" 
               }
    }
    }else{
        other_rm_sh = other_rm_sh rm_sh "\n" 
    }
}    

END{
    #print 追加的时候会在末尾生成换行符的原因是 循环内在拼装的时候每条记录后面都添加了 \n
    rm_sh =  flw_xml_rm_sh "\n" request_xml_rm_sh "\n" response_xml_rm_sh "\n" other_xml_rm_sh "\n" flw_class_rm_sh "\n" cmp_class_rm_sh "\n" dao_class_rm_sh "\n" bean_class_rm_sh "\n" constant_class_rm_sh "\n" biz_class_rm_sh "\n" other_class_rm_sh "\n" other_rm_sh "\n" 
    print rm_sh 
}


