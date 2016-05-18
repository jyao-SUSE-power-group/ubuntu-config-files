#########################################################################
# File Name: autosync.sh
# Author: json_jack
# mail: 351022095@qq.com
# Created Time: 2016年05月18日 星期三 13时30分26秒
#########################################################################
#!/bin/bash

BASE_NAME=$(uname --nodename)/
mkdir -p $BASE_NAME
DIRS="/etc  $(ls /home/$LOGNAME/.*)"
echo " Don't use  root privileges ！ Now sync ： "  $DIRS
rsync   -avzr  --progress $DIRS   $BASE_NAME
