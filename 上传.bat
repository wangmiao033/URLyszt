@echo off
chcp 65001 >nul
echo ========================================
echo 正在上传文件到GitHub...
echo ========================================
echo.

cd /d "%~dp0"

echo 1. 添加文件到Git...
git add index.html vercel.json upload.ps1
if %errorlevel% neq 0 (
    echo 错误: 无法添加文件
    pause
    exit /b 1
)

echo.
echo 2. 提交更改...
git commit -m "添加index.html和vercel.json配置"
if %errorlevel% neq 0 (
    echo 警告: 提交可能失败，继续尝试推送...
)

echo.
echo 3. 推送到GitHub...
git push origin main
if %errorlevel% neq 0 (
    echo.
    echo 尝试推送到master分支...
    git push origin master
)

echo.
echo ========================================
echo 上传完成！
echo ========================================
echo.
echo 您的隐私政策URL: https://ur-lyszt.vercel.app/
echo.
pause