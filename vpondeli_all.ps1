cls

[string] $scriptName = pwd
$scriptName += $MyInvocation.MyCommand.Name
$host.UI.RawUI.WindowTitle = $scriptName

$path = "R:\velikonoce_1901-2100.txt"
$stream = [System.IO.StreamWriter]::new($path)

$out= "nedele    , pondeli"
echo $out
$stream.WriteLine($out)

$m=24            # plati pro 20. a 21. stoleti
$n=5             # ---//---

for ( $rok = 1901; $rok -le 2100; $rok++ ) {

$a=($rok%19)  # po 19 letech se mesicni cyklus opakuje ve stejne dny
$b=($rok%4)   # cyklus opakovani prestupnych roku
$c=($rok%7)   # dorovnani dne v tydnu
#$m=24            # plati pro 20. a 21. stoleti
#$n=5             # ---//---
$d=((19*$a+$m)%30)
$e=(($n+2*$b+4*$c+6*$d)%7)
$u=($d+$e-9)
if ( $u -eq 25 -and $d -eq 28 -and $e -eq 6 -and $a -gt 10 ) {
$u=18
$v=4
} elseif ( $u -ge 1 -and $u -le 25 ) {
$v=4
} elseif ( $u -gt 25 ) {
$u=($u-7)
$v=4
} else {
$u=(22+$d+$e)
$v=3
}

<#
echo $u.GetType()
echo $v.GetType()
echo $rok.GetType()
#>

$out=""
if ( $u -lt 10 ) {
$out+="0"
$out+=$u
$out+="."
}else{
$out+=$u
$out+="."
}

if ( $v -lt 10 ) {
$out+="0"
$out+=$v
$out+="."
}else{
$out+=$v
$out+="."
}
$out+=$rok
#echo $out
#$stream.WriteLine($out)

#echo "Velikonocni nedele vychazi $u.$v.$rok"
#$out=""
$u++
if ( $u -eq 32 )
{
$u=1
$v=4
}
$out+=", "

if ( $u -lt 10 ) {
$out+="0"
$out+=$u
$out+="."
}else{
$out+=$u
$out+="."
}

if ( $v -lt 10 ) {
$out+="0"
$out+=$v
$out+="."
}else{
$out+=$v
$out+="."
}
$out+=$rok
echo $out
$stream.WriteLine($out)
#echo "Velikonocni pondeli vychazi $u.$v.$rok"

}

$stream.close()

