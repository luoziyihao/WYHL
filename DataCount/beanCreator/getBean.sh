#!/bin/sh

rm -rf ./entity/new
mkdir -p ./entity/new
for x
do
    filename=${x##*/}
    awk -f getBean_1.awk $x|awk -f getBean_2.awk > ./entity/new/${filename}
done
