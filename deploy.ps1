# 部署隐私政策到GitHub
Set-Location $PSScriptRoot

# 配置git安全目录
git config --global --add safe.directory $PWD

# 检查是否已有远程仓库
$remoteExists = git remote get-url origin 2>$null
if ($LASTEXITCODE -ne 0) {
    git remote add origin git@github.com:wangmiao033/URLyszt.git
}

# 添加文件
git add .

# 提交
git commit -m "添加隐私政策文档"

# 推送到GitHub
git push -u origin main

# 如果main分支不存在，尝试master
if ($LASTEXITCODE -ne 0) {
    git push -u origin master
}

Write-Host "部署完成！"
Write-Host "如果GitHub Pages已启用，您的隐私政策URL将是："
Write-Host "https://wangmiao033.github.io/URLyszt/privacy-policy.html"