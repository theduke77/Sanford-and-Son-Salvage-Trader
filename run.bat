@echo off
setlocal enabledelayedexpansion

if exist output.txt del output.txt
echo class   Category_666 {> output.txt
set "temp="
for /r %%i in (*.hpp) do (
  if "%%~nxi" NEQ "output.txt" (
  set "temp="
  for /f "usebackq skip=1 delims=" %%j in ("%%~i") do (
    if "!temp!" NEQ "" Echo !temp!
    set temp=%%j
))) >> output.txt
echo };>> output.txt