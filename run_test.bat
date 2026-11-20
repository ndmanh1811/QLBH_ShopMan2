@echo off
chcp 65001 >nul
cd /d "%~dp0"
echo ============================================================
echo   BIEN DICH VA CHAY TEST CASE KIEM THU DON VI (TUAN 7)
echo ============================================================
if not exist "bin" mkdir "bin"
javac -encoding UTF-8 -cp "WebContent\WEB-INF\lib\*;lib\*;." -d bin src\model\*.java src\dao\*.java src\test\*.java
if %ERRORLEVEL% NEQ 0 (
    echo [!] Bien dich that bai! Vui long kiem tra lai ma nguon.
    pause
    exit /b %ERRORLEVEL%
)
java "-Dfile.encoding=UTF-8" -cp "bin;WebContent/WEB-INF/lib/*;lib/*;." test.TestRunner
echo.
pause
