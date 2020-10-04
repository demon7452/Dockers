#!/bin/bash

jar_name=${2}


if [ "${1}" = "" ];
then
    echo -e "\033[0;31m 未输入操作名 \033[0m  \033[0;34m {start|stop|restart|status} \033[0m"
    exit 1
fi

if [ "${jar_name}" = "" ];
then
    echo -e "\033[0;31m 未输入应用名 \033[0m"
    exit 1
fi

function print_process() {
    echo `ps -ef |grep java|grep ${jar_name}|grep -v grep`
}
function count_return() {
    return `ps -ef |grep java|grep ${jar_name}|grep -v grep|wc -l`
}
function pid_return() {
    return `ps -ef |grep java|grep ${jar_name}|grep -v grep|awk '{print $2}'`
}

function status()
{
    count_return
    count=${?}
    if [[ ${count} != 0 ]];then
        echo "${jar_name} is running..."
        print_process
    else
        echo "${jar_name} is not running..."
    fi

    return ${count}
}

function start()
{
    status
    count=${?}

    if [[ ${count} == 0 ]];then
        echo "start ${jar_name}"
        echo "nohup java -jar ${jar_name} &"
        nohup java -jar ${jar_name} &
        echo "Start ${jar_name} success..."
        pid_return
    fi
}

function stop()
{
    status
    count=${?}

    if [[ ${count} != 0 ]];then
        echo "start stop ${jar_name}"

        process_pid=`ps -ef |grep java|grep ${jar_name}|grep -v grep|awk '{print $2}'`
        kill -s 9 ${process_pid}

        echo "finished stop ${jar_name}"
    fi
}

function restart()
{
    stop
    sleep 2
    start
    print_process
}


case ${1} in
    start)
        start;;
    stop)
        stop;;
    restart)
        restart;;
    status)
        status;;
    *)

    echo -e "\033[0;31m Usage: \033[0m  \033[0;34m sh  $0  {start|stop|restart|status}  {{jar_name}} \033[0m
\033[0;31m Example: \033[0m
      \033[0;33m sh  $0  start esmart-test.jar \033[0m"
esac