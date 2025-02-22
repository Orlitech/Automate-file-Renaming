@echo off
setlocal enabledelayedexpansion

:: Get current date in DDMMYYYY format
for /f "tokens=2 delims==" %%I in ('wmic os get localdatetime /value ^| find "="') do set datetime=%%I
set date=!datetime:~6,2!!datetime:~4,2!!datetime:~0,4!

set count=1
for %%F in (*.*) do (
    set newname=Title !date! !count!%%~xF
    ren "%%F" "!newname!"
    set /a count+=1
)

echo Files renamed successfully!
pause
