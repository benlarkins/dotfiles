#!/usr/bin/sh

iwconfig wlp4s0 | grep -q no\ wireless\ extensions\. && {
  echo wired
  exit 0
}

essid=`iwconfig wlp4s0 | awk -F '"' '/ESSID/ {print $2}'`
stngth=`iwconfig wlp4s0 | awk -F '=' '/Quality/ {print $2}' | cut -d '/' -f 1`
bars=`expr $stngth / 25`

case $bars in
  0)  bar='' ;;
  1)  bar='' ;;
  2)  bar='' ;;
  3)  bar='' ;;
  4)  bar='' ;;
  *)  bar='' ;;
esac

echo $bar

exit 0
