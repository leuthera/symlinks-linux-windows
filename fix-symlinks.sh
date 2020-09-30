#!/bin/bash
server=$1
server_path=$2

for symlink in $(git ls-files -s | gawk '/12000/{print $4}');
do
    target=$(<$symlink)
    ssh $ssh_server -t "cd $server_path; ln -s $target $symlink"
done
