#!/bin/bash
# Author: Ezreal
# Date: 2015.11.17
# Version: 1.0

path=`cat /etc/crontab | grep /app/run | awk -F' ' '{print $8}'`
mainpath=`cat /etc/crontab | grep /app/run | awk -F' ' '{print $8}' | awk -F'/run' '{print $1}'| uniq`
mainconfpath="$mainpath/config/Main.config.inc"
sedpara="s:include_once '../config/Main.config.inc';:include_once '$mainconfpath';:g"

checkfile(){
for i in $path
do
	tuichu=0
	if [ ! -f "$i" ];then
		printf "%-55s %s\n" $i 'not exist!'
		export tuichu=1
	else
		printf "%-55s %s" $i `cat $i | grep Main.config`
		echo
	fi
	if [ $tuichu == 1 ];then
		exit
	fi
done
}

modify(){
for i in $path
do
	sed -i "$sedpara" $i
done
}

if [[ $1 == "modify" ]];then
	modify
	checkfile
else
	checkfile
fi

