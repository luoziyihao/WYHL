BEGIN{}

toupper($2) ~ /STR/{
    beanStr = beanStr "@Column(length = , nullable = false)\nprivate String " tolower($1) ";\n\n"
    }
toupper($2) ~ /LONG/{
    beanStr = beanStr "@Column(nullable = false)\nprivate long " tolower($1) ";\n\n"
    }
toupper($2) ~ /INT/{
    beanStr = beanStr "@Column(nullable = false)\nprivate int " tolower($1) ";\n\n"
    }
toupper($2) ~ /DATE/{
    beanStr = beanStr "@JsonFormat(timezone = \"GMT+8\")\n@Column(nullable = false)\nprivate Date " tolower($1) ";\n\n"
    }
toupper($2) ~ /DOUBLE/{
    beanStr = beanStr "@Column(nullable = false)\nprivate double " tolower($1) ";\n\n"
    }
toupper($2) ~ /DOU/ && toupper($2) !~ /DOUBLE/{
    beanStr = beanStr "@Column(nullable = false)\nprivate double " tolower($1) ";\n\n"
    }

    END{
        print beanStr
        }
