#!/bin/sh

a=1
max=${3:-10} # set default max to be 10
failed=0

echo "Getting percentage of failed tests"
echo "running: " $2 " " $3 "times"

until [ $a -gt $max ]
do
   echo "round:" $a "of" $max
   if bundle exec $1 $4 $5 $2 | grep -E "Failing|Failure/Error"; then
     echo " failed"
     ((failed++))
   else
     echo " success"
   fi
   ((a++))
done

echo "failed" $failed "out of" $max "times"
percent=$((100*failed/max))
echo "failed" $percent"% of the time"
