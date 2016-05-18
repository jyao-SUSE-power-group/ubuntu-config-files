# ubuntu-config-files
记录 系统 软件配置

-- 记录 awk语法
```
awk中使用shell中的变量

一: "'$var'"

这种写法大家无需改变用'括起awk程序的习惯,是老外常用的写法.如:

var="test"
awk 'BEGIN{print "'$var'"}'

这种写法其实际是双括号变为单 括号的常量,传递给了awk.

如果var中含空格,为了shell不把空格作为分格符,便应该如下使用:

var="this is a test"
awk 'BEGIN{print "'"$var"'"}'
二: '"$var"'

这种写法与上一种类似.如果变量含空格,则变为'""$var""'较为可靠.
三: export变量,使用ENVIRON["var"]形式,获取环境变量的值

例如:
var="this is a test"; export var;

awk 'BEGIN{print ENVIRON["var"]}'
四:可以使用awk的-v选项 （如果变量个数不多，个人偏 向于这种写法）

例如:
var="this is a test"
awk -v awk_var="$var" 'BEGIN {print awk_var}'

这样便把系统变量var传递给了awk变量awk_var.



 awk向shell变量传递值

“由awk向shell传递变量”，其思想无非是用awk(sed/perl等也是一样)输出若干条shell命令，然后再用shell去执行这些命令。

eval $(awk 'BEGIN{print "var1='str1';var2='str2'"}')

或者eval $(awk '{printf("var1=%s; var2=%s; var3=%s;",$1,$2,$3)}' abc.txt)

之后可以在当前shell中使用var1,var2等变量了。

echo "var1=$var1 ----- var2=$var2"



 参考资料：

http://developer.51cto.com/art/200509/3781.htm

http://www.ixpub.net/thread-1457438-1-1.html
```
