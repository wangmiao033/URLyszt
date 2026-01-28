# 上传文件到GitHub仓库
# 使用方法：在PowerShell中执行 .\upload.ps1

Write-Host "开始上传文件到GitHub..." -ForegroundColor Green

# 获取当前脚本所在目录
$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $scriptPath

# 配置Git安全目录（解决路径编码问题）
$currentDir = (Get-Location).Path
Write-Host "当前目录: $currentDir" -ForegroundColor Cyan
try {
    git config --global --add safe.directory $currentDir 2>$null
    Write-Host "已配置Git安全目录" -ForegroundColor Green
} catch {
    Write-Host "警告: 无法配置Git安全目录，继续尝试..." -ForegroundColor Yellow
}

# 检查git是否安装
try {
    $gitVersion = git --version
    Write-Host "Git版本: $gitVersion" -ForegroundColor Cyan
} catch {
    Write-Host "错误: 未找到Git，请先安装Git" -ForegroundColor Red
    exit 1
}

# 检查是否在git仓库中
if (-not (Test-Path .git)) {
    Write-Host "初始化Git仓库..." -ForegroundColor Yellow
    git init
}

# 添加远程仓库
$remoteUrl = "git@github.com:wangmiao033/URLyszt.git"
$existingRemote = git remote get-url origin 2>$null

if ($LASTEXITCODE -ne 0) {
    Write-Host "添加远程仓库: $remoteUrl" -ForegroundColor Yellow
    git remote add origin $remoteUrl
} else {
    if ($existingRemote -ne $remoteUrl) {
        Write-Host "更新远程仓库地址..." -ForegroundColor Yellow
        git remote set-url origin $remoteUrl
    } else {
        Write-Host "远程仓库已配置: $remoteUrl" -ForegroundColor Cyan
    }
}

# 添加所有文件
Write-Host "添加文件到暂存区..." -ForegroundColor Yellow
git add .

# 检查是否有更改
$status = git status --porcelain
if ([string]::IsNullOrWhiteSpace($status)) {
    Write-Host "没有需要提交的更改" -ForegroundColor Yellow
} else {
    Write-Host "提交更改..." -ForegroundColor Yellow
    git commit -m "添加隐私政策文档和Vercel配置"
    
    # 推送到GitHub
    Write-Host "推送到GitHub..." -ForegroundColor Yellow
    Write-Host "请选择分支:" -ForegroundColor Cyan
    Write-Host "1. main (推荐)"
    Write-Host "2. master"
    
    $branch = Read-Host "请输入选项 (1 或 2，默认为1)"
    if ([string]::IsNullOrWhiteSpace($branch) -or $branch -eq "1") {
        git branch -M main
        git push -u origin main
    } else {
        git push -u origin master
    }
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host "`n上传成功！" -ForegroundColor Green
        Write-Host "您的隐私政策URL: https://ur-lyszt.vercel.app/" -ForegroundColor Cyan
        Write-Host "GitHub仓库: https://github.com/wangmiao033/URLyszt" -ForegroundColor Cyan
    } else {
        Write-Host "`n推送失败，请检查:" -ForegroundColor Red
        Write-Host "1. SSH密钥是否已配置" -ForegroundColor Yellow
        Write-Host "2. 是否有推送权限" -ForegroundColor Yellow
        Write-Host "3. 网络连接是否正常" -ForegroundColor Yellow
    }
}

Write-Host "`n完成！" -ForegroundColor Green