@echo off
setlocal enabledelayedexpansion

for %%a in (*.gb *.gba *.gbc *.iso *.nds *.cdi *.nes *.smd *.z64 *.n64 *.sfc *.pce *.bin *.cue *.pbp *.srm *.cia *smc) do (
    set "filename=%%~na"
    set "ext=%%~xa"
    set "newname=!filename!"
    
    call :remove_specific_tags
    
    set "newname=!newname!!ext!"
    if not "!filename!!ext!"=="!newname!" (
        echo Renaming "%%a" to "!newname!"
        ren "%%a" "!newname!"
    )
)

echo  It's Done (Tags removed from the roms, enjoy.)
pause
exit /b

:remove_specific_tags
:loop
set "oldname=!newname!"
set "newname=!newname:(U)=!"
set "newname=!newname:(USA)=!"
set "newname=!newname:(Unl)=!"
set "newname=!newname:(En,Es)=!"
set "newname=!newname:(En,De)=!"
set "newname=!newname:(En,Fr)=!"
set "newname=!newname:(Fr,Nl)=!"
set "newname=!newname:(Europe)=!"
set "newname=!newname:(Japan)=!"
set "newname=!newname:(France)=!"
set "newname=!newname:(World)=!"
set "newname=!newname:(Proto)=!"
set "newname=!newname:(Indepedent)=!"
set "newname=!newname:(DMG-N5)=!"
set "newname=!newname:(Rev A)=!"
set "newname=!newname:(En,Fr,De)=!"
set "newname=!newname:(En,Fr,Es)=!"
set "newname=!newname:(USA, Europe)=!"
set "newname=!newname:(USA, Australia)=!"
set "newname=!newname:(SGB Enhanced)=!"
set "newname=!newname:(En,Ja,Fr,De)=!"
set "newname=!newname:(En,Fr,De,Es)=!"
set "newname=!newname:(En,Fr,De,It)=!"
set "newname=!newname:(En,Fr,De,Nl)=!"
set "newname=!newname:(GBC,SGB Enhanced)=!"
set "newname=!newname:(En,Fr,De,Es,It)=!"
set "newname=!newname:(En,Ja,Fr,De,Es)=!"
set "newname=!newname:(En,Ja,Fr,De,Es,It)=!"
set "newname=!newname:(En,Fr,De,Es,It,Nl)=!"
set "newname=!newname:(En,Fr,De,Es,It,Nl,Pt,Da)=!"
set "newname=!newname:(En,Fr,De,Es,It,Nl,Pt,Sv)=!"
set "newname=!newname:(En,Fr,De,Es,It,Nl,Sv,Da)=!"
set "newname=!newname:(En,Fr,De,Es,It,Sv,No,Da,Fi)=!"
set "newname=!newname:(En,Fr,De,Es,It,Nl,Pt,Sv,No,Da)=!"
set "newname=!newname:(En,Fr,De,Es,It,Nl,Pt,Sv,No,Da,Fi)=!"
set "newname=!newname:(En,Ja,Fr,De,Es+En,Ja,Fr,De,Es,It)=!"
set "newname=!newname:(En,Fr,De,Es,It,Nl+En,Fr,De,Es,It,Nl,Sv,No,Da,Fi)=!"

if not "!newname!"=="!oldname!" goto loop
exit /b