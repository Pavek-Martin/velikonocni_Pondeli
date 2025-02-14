@echo off
title vypocet, velikonocni nedele a velikoncni pondeli

set /p rok="rok ? "

REM powershell -File .\vpondeli.ps1 %rok%
vpondeli.exe %rok%

pause
@echo on
