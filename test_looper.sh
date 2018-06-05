#!/bin/sh

a=1
max=$2
failed=0

echo "running: " $1 " " $2 " times"

until [ $a -gt $max ]
do
   echo "round:" $a "of" $max
   if bundle exec cucumber --color $1 | grep "failed"; then
     echo " failed"
     ((failed++))
   else
     echo " success"
   fi
   ((a++))
done

echo "failed" $failed "times out of" $max
