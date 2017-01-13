BEGIN{
    FS = "[\t ][\t ]*"
    HEANERECT = "| "
    SPACEERECT = " | "
    TAILERECT = " |"
    }


{
    # | roomId | 房间ID | 无 |
    beanStr = beanStr HEANERECT $1 SPACEERECT $2 SPACEERECT "无" TAILERECT "\n"
    }

    END{
        print beanStr
        }
