#!/bin/sh
if [ $(bluetoothctl show | grep "Powered: yes" | wc -c) -eq 0 ]
then
  echo "%{T2}%{F#32344a}󰂲%{T-}"
else
  if [ $(echo info | bluetoothctl | grep 'Device' | wc -c) -eq 0 ]
  then 
    echo "󰂯s"
  fi
  echo "%{T2}%{F#32344a}󰂯%{T-}"
fi
