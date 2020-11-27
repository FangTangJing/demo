#!/bin/bash

msg(){
    echo "`date +'%F %T'` $1"
}

if [ -z "$@" ]
then
    msg "Start ${app_name} of ${app_env}."
    cd /opt
    exec java -server -Denv=${app_env} -Dfile.encoding=utf-8 -jar -Duser.timezone=GMT+08 /opt/${app_name}.jar -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap -XshowSettings:vm -XX:MaxRAMFraction=1

    msg "ERROR: ${app_name} exited with code $?"   && exit 1
else
    "$@"
fi
