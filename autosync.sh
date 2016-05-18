#########################################################################
# File Name: autosync.sh
# Author: json_jack
# mail: 351022095@qq.com
# Created Time: 2016年05月18日 星期三 13时30分26秒
#########################################################################
#!/bin/bash

DIR=$(uname --nodename)/
mkdir -p $DIR
rsync   -avzr  /etc   $DIR
