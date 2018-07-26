#!/bin/bash
USEDPERC="$(free | grep Mem | awk '{print $3/$2 * 100.0}')"
USEDPERC=${USEDPERC%.*}
#echo $USEDPERC

     if [ "$USEDPERC" -ge  80 ] 
      then
         sync; echo 3 > /proc/sys/vm/drop_caches
         echo "Clear Ram Completed."
      else
         echo "Ram OK "
      fi