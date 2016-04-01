BEGIN{}

{   if(FNR%2==1){
        a[FNR]=$1
    }
    if(FNR%2==0){
        a[FNR-1]=a[FNR-1] "\t" $1
        }
    }

END{
    for (record in a){
            printstr = printstr a[record ]"\n"
        }
        print printstr
    }
