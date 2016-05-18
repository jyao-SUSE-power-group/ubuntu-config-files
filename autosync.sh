#########################################################################
# File Name: autosync.sh
# Author: json_jack
# mail: 351022095@qq.com
# Created Time: 2016年05月18日 星期三 13时30分26秒
#########################################################################
#!/bin/bash

BASE_NAME=$(uname --nodename)
mkdir -p $BASE_NAME
HOME_DIR=/home/$LOGNAME/
DIRS="/etc  $(/bin/ls -AF $HOME_DIR | grep '^\.')"
BLACK_LIST_DIRS=".ssh/ .bash_history  .zsh_history"
echo " Don't use  root privileges ！ Now sync ： "  $DIRS
for dir in $DIRS; do
  if echo $BLACK_LIST_DIRS | grep $dir; then
    #statements
    echo 敏感文件（夹）不予备份
  else
    #statements
    #  eval $(du -s   /home/john/.oh-my-zsh   | sort -nr | awk '{printf("var1=%s", $1)}')
    #  eval $(du -s   $HOME_DIR$dir   | sort -nr | awk '{printf("var1=%s", $1)}')
    eval $(du -s   $HOME_DIR$dir   | sort -nr | awk '{printf("file_or_dir_size=%s", $1)}')
    echo current file_or_dir_size is : $file_or_dir_size
  #let file_or_dir_size=$file_or_dir_size + 10
   file_or_dir_size_tmp=`expr $file_or_dir_size + 10`
    if [ $file_or_dir_size_tmp -le 20000 ]; then
      #statements
      echo 小于  20M
        if [ -d $dir ]; then
          #statements
          echo 目录存在
        else
            echo 目录不存在
         dir=$HOME_DIR$dir
         echo    $dir
        fi
         echo  当前备份    $dir 目录或文件
        rsync   -avzR  --progress  $dir   $BASE_NAME

    else
      echo  大于 20M 不予备份
    fi

  fi
done

#rsync   -avzr  --progress $DIRS   $BASE_NAME
