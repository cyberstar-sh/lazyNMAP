@echo off
title lazyNMAP
color 0a

:menu
cls
echo.
echo  Nmap Easy Scanner
echo  =================
echo.
echo  1. Quick Scan (Top 100 ports)
echo  2. Full Port Scan (All 65535 ports)
echo  3. OS Detection Scan
echo  4. Vulnerability Scan (NSE scripts)
echo  5. UDP Scan
echo  6. Custom Scan
echo  7. Exit
echo.
set /p choice=Enter your choice (1-7): 

if "%choice%"=="1" goto quick
if "%choice%"=="2" goto full
if "%choice%"=="3" goto os
if "%choice%"=="4" goto vuln
if "%choice%"=="5" goto udp
if "%choice%"=="6" goto custom
if "%choice%"=="7" exit

echo Invalid choice, please try again
pause
goto menu

:quick
cls
echo Quick Scan (Top 100 ports)
echo.
set /p target=Enter target IP or hostname: 
echo Scanning %target%...
nmap -T4 -F %target%
pause
goto menu

:full
cls
echo Full Port Scan (All 65535 ports)
echo.
set /p target=Enter target IP or hostname: 
echo Scanning %target%...
nmap -T4 -p- %target%
pause
goto menu

:os
cls
echo OS Detection Scan
echo.
set /p target=Enter target IP or hostname: 
echo Scanning %target%...
nmap -T4 -A %target%
pause
goto menu

:vuln
cls
echo Vulnerability Scan
echo.
set /p target=Enter target IP or hostname: 
echo Scanning %target%...
nmap -T4 --script vuln %target%
pause
goto menu

:udp
cls
echo UDP Scan
echo.
set /p target=Enter target IP or hostname: 
echo Scanning %target%...
nmap -T4 -sU %target%
pause
goto menu

:custom
cls
echo Custom Scan
echo.
set /p target=Enter target IP or hostname (or type 'help' for options): 

if "%target%"=="help" goto custom_help

set /p options=Enter Nmap options (e.g., -sS -p 80,443 -A): 
echo Scanning %target% with options: %options%
nmap %options% %target%
pause
goto menu

:custom_help
cls
echo Common Nmap Scan Options:
echo =========================
echo.
echo BASIC SCAN TYPES:
echo -----------------
echo -sS      TCP SYN scan (stealthy, default)
echo -sT      TCP connect scan
echo -sU      UDP scan
echo -sN/-sF  Null/FIN scans (firewall evasion)
echo.
echo PORT SPECIFICATION:
echo -------------------
echo -p 80        Scan port 80
echo -p 1-100     Scan ports 1 through 100
echo -p-          Scan all 65535 ports
echo -p 80,443    Scan ports 80 and 443
echo -F           Fast scan (top 100 ports)
echo.
echo SERVICE/OS DETECTION:
echo ---------------------
echo -sV      Detect service versions
echo -O       Detect OS
echo -A       Aggressive scan (OS, version, script, traceroute)
echo.
echo TIMING AND PERFORMANCE:
echo -----------------------
echo -T0      Paranoid (slowest)
echo -T1      Sneaky
echo -T2      Polite
echo -T3      Normal (default)
echo -T4      Aggressive (fast)
echo -T5      Insane (very fast)
echo.
echo SCRIPT SCAN:
echo ------------
echo --script vuln       Vulnerability scan
echo --script safe       Safe scripts
echo --script=http-title Get website title
echo.
echo OUTPUT:
echo -------
echo -oN file.txt    Normal output
echo -oX file.xml    XML output
echo -oG file.grep   Grepable output
echo.
pause
goto custom
