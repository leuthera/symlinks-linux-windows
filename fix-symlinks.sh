#!/bin/bash
ssh_server=$1
server_path=$2
dry=$3

for symlink in $(git ls-files -s | gawk '/12000/{print $4}');
do
    target=$(<$symlink)
    if [ -n "$dry" ]; then
        echo "fixing w/ ssh $ssh_server -t 'cd $server_path; ln -sf $target $symlink'"
    else
        ssh $ssh_server -t "cd $server_path; ln -sf $target $symlink"
    fi
done
