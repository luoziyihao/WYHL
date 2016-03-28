BEGIN{
    FS = "  | "
    INSERT_SQL_HEAD =  "INSERT INTO `live_msg` (`id`, `content`, `date`, `ip`, `title`, `roomId`) VALUES ("
    INSERT_HAED = " );"
    YEAR_START = 1995
    }

    {
     for(i=0;i<1000;){
           YEAR_START--
           printsql = printsql INSERT_SQL_HEAD i++ ", " "'内容'" ", " "'" YEAR_START  "-01-15 03:07:19" "', " "'127.0.0.1'" ", " "'标题一'" ","  "'" j++ "'"  INSERT_HAED "\n"
           printsql = printsql INSERT_SQL_HEAD i++ ", " "'内容'" ", " "'" YEAR_START  "-01-15 03:08:19" "', " "'127.0.0.1'" ", " "'标题一'" ","  "'" j++ "'"  INSERT_HAED "\n"
           printsql = printsql INSERT_SQL_HEAD i++ ", " "'内容'" ", " "'" YEAR_START  "-01-15 03:09:19" "', " "'127.0.0.1'" ", " "'标题一'" ","  "'" j++ "'"  INSERT_HAED "\n"
           printsql = printsql INSERT_SQL_HEAD i++ ", " "'内容'" ", " "'" YEAR_START  "-01-16 03:07:19" "', " "'127.0.0.1'" ", " "'标题一'" ","  "'" j++ "'"  INSERT_HAED "\n"
           printsql = printsql INSERT_SQL_HEAD i++ ", " "'内容'" ", " "'" YEAR_START  "-01-16 03:08:19" "', " "'127.0.0.1'" ", " "'标题一'" ","  "'" j++ "'"  INSERT_HAED "\n"
           printsql = printsql INSERT_SQL_HEAD i++ ", " "'内容'" ", " "'" YEAR_START  "-01-16 03:09:19" "', " "'127.0.0.1'" ", " "'标题一'" ","  "'" j++ "'"  INSERT_HAED "\n"
         }  

    }
        
 END{
     print printsql 
    }
