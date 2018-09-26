#!/bin/bash

function check_ram_used_centos {
  USEDPERC="$(free -m | grep Mem | awk '{print $3/$2 * 100.0}')"
  USEDPERC=${USEDPERC%.*}
  #echo $USEDPERC "Centos" 
    if [ "$USEDPERC" -ge  80 ] 
      then
         sync; echo 3 > /proc/sys/vm/drop_caches
         echo "Clear Ram Completed."
      else
         echo "Ram OK "
      fi
      
}
function check_ram_used_ubuntu {
  #USEDPERC="$(free | grep Mem | awk '{print $3/$2 * 100.0}')"
  USEDPERC="$(free -m  | grep Mem | awk '{print ($6+$3)/$2 *100.0}')"
  USEDPERC=${USEDPERC%.*}
  echo $USEDPERC
  if [ "$USEDPERC" -ge  80 ] 
      then
         sync; echo 3 > /proc/sys/vm/drop_caches
         echo "Clear Ram Completed."
      else
         echo "Ram OK "
  fi
}

if [ -x /usr/bin/yum ]; then
    check_ram_used_centos
fi

if [ -x /usr/bin/apt-get ]; then
    check_ram_used_ubuntu
fi
