@echo off
setlocal enabledelayedexpansion

set "logfile=%~dp0renamelog.txt"
echo === Rename Log - %date% %time% === > "%logfile%"
echo. >> "%logfile%"

for /r %%a in (*.gb *.gba *.gbc) do (
    set "filepath=%%a"
    set "filename=%%~na"
    set "ext=%%~xa"
    set "newname=!filename!"

    rem --- Remove parentheses content ---
:loop1
    for /f "tokens=1* delims=()" %%b in ("!newname!") do (
        set "newname=%%b%%c"
    )
    echo !newname! | find "(" >nul && goto loop1

    rem --- Remove square brackets content ---
:loop2
    for /f "tokens=1* delims=[]" %%b in ("!newname!") do (
        set "newname=%%b%%c"
    )
    echo !newname! | find "[" >nul && goto loop2

    rem --- Trim leading/trailing spaces ---
    for /f "tokens=* delims= " %%z in ("!newname!") do set "newname=%%z"

    rem --- Collapse double spaces ---
:fixspaces
    set "tmp=!newname!"
    set "newname=!newname:  = !"
    if not "!tmp!"=="!newname!" goto fixspaces

    rem --- Collapse double dashes ---
:fixdashes
    set "tmp=!newname!"
    set "newname=!newname:--=-!"
    if not "!tmp!"=="!newname!" goto fixdashes

    rem --- Trim again in case spaces left around ---
    for /f "tokens=* delims= " %%z in ("!newname!") do set "newname=%%z"

    rem --- Build full new path ---
    set "newpath=%%~dpa!newname!!ext!"

    rem --- Rename if changed ---
    if /i not "%%a"=="!newpath!" (
        echo REN "%%a" → "!newname!!ext!" >> "%logfile%"
        ren "%%a" "!newname!!ext!"
    )
)

echo. >> "%logfile%"
echo === Finished at %time% === >> "%logfile%"
echo Done! (All tags cleaned, check renamelog.txt for details)
pause
