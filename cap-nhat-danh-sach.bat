@echo off
chcp 65001 >nul
title Cập Nhật Danh Sách Bài Tập
echo ===================================================
echo     DANG QUET THU MUC TOAN VA TIENG-ANH...
echo ===================================================
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0update-list.ps1"
echo.
echo Nhan phim bat ky de thoat...
pause >nul
