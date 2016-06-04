#!/bin/sh

NEWPATH="./n_interface"
rm -rf ${NEWPATH}
mkdir -p ${NEWPATH}
for x
do
    filename=${x##*/}
    awk -f getInterface.awk $x > ${NEWPATH}"/"${filename}".do"
done
