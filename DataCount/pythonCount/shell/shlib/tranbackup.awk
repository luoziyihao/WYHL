BEGIN{
    FS = "[\t ]"
    BP_SYSNM = "CashManage" 
    BP_CONFIG = "config" 
    BP_CLASSES = "classes" 
}


$1 ~ /cp/ {
    #备份文件的服务器路径
    backuphostpath = $3
    #位置索引
    config_index = index(backuphostpath, BP_CONFIG)
    classes_index = index(backuphostpath, BP_CLASSES)
    #实际的索引
    if(config_index != 0){
        projectindex = config_index
        }else{
        projectindex = classes_index
    }
    #以classes或config开头的文件路径 eg: config/SYSDATA/ServiceReqCfg.xml
    projectpath = substr(backuphostpath, projectindex - 1)

    #备份文件目录 eg: ./bak/config/SYSDATA/
    backuppath = "./bak" substr(projectpath, 1, getlastindex(projectpath,"/"))

    #创建目录脚本
    mkbackpath_sh = mkbackpath_sh "mkdir -p " backuppath "\n"
    #复制脚本
    backup_sh=backup_sh  "cp -rf "backuphostpath " "backuppath "\n"
}    

END{
    print backup_sh > "cpfile.sh"
    print mkbackpath_sh  > "mkbackdir.sh"
}


