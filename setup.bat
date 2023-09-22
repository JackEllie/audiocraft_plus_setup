@echo off

set PYTHON_VER=3.10.6

:: Check if Python version meets the recommended version
python --version 2>nul | findstr /b /c:"Python %PYTHON_VER%" >nul
if errorlevel 1 (
    echo Warning: Python version %PYTHON_VER% is recommended.
)

IF NOT EXIST venv (
    echo Creating venv...
    python -m venv venv
)

call .\venv\Scripts\activate.bat

if %errorlevel% equ 0 (
    call pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118
    call pip install -r requirements.txt
    echo Successfully activated virtual environment.
) else (
    echo Failed to activate virtual environment.
)

pause

