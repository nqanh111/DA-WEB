@echo off
echo ========================================
echo   AutoLux Car Showroom - Local Server
echo ========================================
echo.
echo Starting server on http://localhost:8000
echo Press Ctrl+C to stop the server
echo.
echo Opening browser...
timeout /t 2 /nobreak >nul
start http://localhost:8000
python -m http.server 8000
