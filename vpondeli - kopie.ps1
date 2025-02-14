#cls

<#
script puvodne pro bash prepsany do PowerShell, vse funguje uplne stejne, vcetne funkce modulo
spoustet nejlepe pres davku vpondeli.bat
v davce zmacknuti enteru bez zadani niceho vypise vypocet pro letosni rok, viz. screenshoty
#>

# v zahlavi spusteneho okna zobrazi informoce ( neco jako echo $0 v bash )
[string] $scriptName = pwd
#$scriptName += "\"
$scriptName += $MyInvocation.MyCommand.Name
$host.UI.RawUI.WindowTitle = $scriptName

$delka_args = $args.length
#echo "celkem args $delka_args"
#$delka_args.GetType() #Int32
 
if ($delka_args -ne 1 ) {
echo "napr."
echo "powershell -File .\vpondeli.ps1 2026"
echo ""
echo "Rok musi byt z 20. nebo 21. stoleti. Pouzije se aktualni rok."
echo ""
[int32] $rok = (get-date).Year
} else {
[int32] $rok = $args[0]
}

# 1901 - 2100
if ( $rok -le 1900 -or $rok -gt 2100 ) {
echo "Rok musi byt z 20. nebo 21. stoleti. Pouzije se aktualni rok."
[int32] $rok = (get-date).Year
}

#$rok = [int32] $rok
#echo $rok
#echo $rok.GetType()

$a=($rok%19)  # po 19 letech se mesicni cyklus opakuje ve stejne dny
$b=($rok%4)   # cyklus opakovani prestupnych roku
$c=($rok%7)   # dorovnani dne v tydnu
$m=24            # plati pro 20. a 21. stoleti
$n=5             # ---//---
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

echo "Velikonocni nedele vychazi $u.$v.$rok"
$u++
if ( $u -eq 32 )
{
$u=1
$v=4
}
echo "Velikonocni pondeli vychazi $u.$v.$rok"

