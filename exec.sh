#!/bin/bash
#该脚本为linux下启动程序的通用脚本

#环境变量设置
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./

process="diting"
echo $process
pid=0

getpid() {
    pidstr=`ps x | grep $process | grep -v grep`
#    echo $pidstr
    if [ -n "$pidstr" ]; then
        pid=`echo $pidstr | awk '{print $1}'`
    else
        pid=0
    fi
}

start() {
    getpid
    if [ $pid -ne 0 ]; then
        echo "warn: $process already started! (pid=$pid)"
    else
        echo -n "start $process ..."
        ./$process -m d -d y
        getpid
        if [ $pid -ne 0 ]; then
            echo "$process has started (pid=$pid) [ok]"
        else
            echo "$process [failed]"
        fi
    fi
}

stop() {
    getpid
    if [ $pid -eq 0 ]; then
        echo "warn: $process already stoped!"
    else
        echo -n "stop $process ...(pid=$pid)"
        kill -9 $pid
        if [ $? -eq 0 ]; then
            echo "$process has stoped [ok]"
        else
            echo "$process [failed]"
        fi
    fi
}

status() {
    getpid
    if [ $pid -ne 0 ]; then
        echo "warn: $process already started! (pid=$pid)"
    else
        echo "warn: $process already stoped!"
    fi
}

info() {
    echo "info...."
}

case $1 in
    "start")
        start
        ;;
    "stop")
        stop
        ;;
    "restart")
        stop
        start
        ;;
    "status")
        status
        ;;
    "info")
        info
        ;;
    *)
        echo "Usage: $0 {start|stop|restart|status|info}"
        exit 1
        ;;
esac