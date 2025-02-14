#!/usr/bin/bash
# zdroj: http://cs.wikipedia.org/wiki/V%C3%BDpo%C4%8Det_data_Velikonoc
# platne pro 20. a 21. století

rok=$1

[ $# -ne 1 ] && rok=`date +%Y`
nums=`tr -d "0-9" <<<"$rok"`
if [ "$nums" != "" ]; then
    echo "Parametr \"$rok\" nevyjadruje rok. Pouzije se aktualni rok."
    rok=`date +%Y`
fi
if [ $rok -le 1900 -o $rok -gt 2100 ]; then
    echo "Rok musi byt z 20. nebo 21. stoleti. Pouzije se aktualni rok."
    rok=`date +%Y`
exit 1
fi

a=$(($rok%19))	# po 19 letech se mesicni cyklus opakuje ve stejne dny
b=$(($rok%4))	# cyklus opakovani prestupnych roku
c=$(($rok%7))	# dorovnani dne v tydnu
m=24		# plati pro 20. a 21. stoleti
n=5		# ---//---
d=$(((19*$a+$m)%30))
e=$((($n+2*$b+4*$c+6*$d)%7))
u=$(($d+$e-9))
if [ $u -eq 25 -a $d -eq 28 -a $e -eq 6 -a $a -gt 10 ]; then
    u=18
    v=4
elif [ $u -ge 1 -a $u -le 25 ]; then
    v=4
elif [ $u -gt 25 ]; then
    u=$(($u-7))
    v=4
else
    u=$((22+$d+$e))
    v=3
fi
echo "Velikonocni nedele vychazi $u.$v.$rok"

u=$(($u+1))
if [ $u -eq 32 ]; then
    u=1
    v=4
fi
echo "Velikonocni pondeli vychazi $u.$v.$rok"

