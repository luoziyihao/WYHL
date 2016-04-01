#!/bin/sh

for x
do
    awk -f getBean.awk $x|awk -f getBean_2.awk > ${x}bean
done
