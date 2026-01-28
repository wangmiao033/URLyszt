# 隐私政策部署说明

## 文件说明

- `privacy-policy.html` - 隐私政策HTML文档
- `deploy.ps1` - PowerShell部署脚本（可选使用）

## 部署方式

### 方式一：GitHub Pages（推荐，免费）

**您的仓库地址：** `git@github.com:wangmiao033/URLyszt.git`

#### 快速部署步骤：

1. **打开PowerShell或Git Bash，进入项目目录：**
   ```powershell
   cd "H:\Y云上征途ios\URL"
   ```

2. **初始化Git仓库（如果还没有）：**
   ```powershell
   git init
   ```

3. **添加远程仓库：**
   ```powershell
   git remote add origin git@github.com:wangmiao033/URLyszt.git
   ```
   （如果远程仓库已存在，使用 `git remote set-url origin git@github.com:wangmiao033/URLyszt.git`）

4. **添加并提交文件：**
   ```powershell
   git add .
   git commit -m "添加隐私政策文档"
   ```

5. **推送到GitHub：**
   ```powershell
   git branch -M main
   git push -u origin main
   ```
   或者如果使用master分支：
   ```powershell
   git push -u origin master
   ```

6. **启用GitHub Pages：**
   - 访问 https://github.com/wangmiao033/URLyszt
   - 点击 Settings（设置）
   - 在左侧菜单找到 Pages
   - 在 Source 下选择 main 或 master 分支
   - 点击 Save（保存）

7. **访问您的隐私政策URL：**
   ```
   https://wangmiao033.github.io/URLyszt/privacy-policy.html
   ```
   
   **注意：** GitHub Pages 可能需要几分钟时间才能生效。

### 方式二：其他静态网站托管服务

- **Netlify**: 拖拽HTML文件到Netlify，获得免费URL
- **Vercel**: 上传文件到Vercel，获得免费URL
- **Cloudflare Pages**: 免费静态网站托管
- **自己的服务器**: 将HTML文件上传到您的Web服务器

### 方式三：本地测试

如果需要本地测试，可以使用Python简单HTTP服务器：

```bash
# Python 3
python -m http.server 8000

# 然后访问 http://localhost:8000/privacy-policy.html
```

## 注意事项

1. **更新联系信息**: 请将HTML文件中的邮箱地址和公司地址替换为您的实际联系信息
2. **根据实际功能调整**: 请根据您的应用实际收集的数据类型调整隐私政策内容
3. **法律合规**: 建议咨询法律专业人士，确保隐私政策符合当地法律法规要求
4. **定期更新**: 当应用功能或数据收集方式发生变化时，请及时更新隐私政策

## 在App Store Connect中使用

1. 将隐私政策部署到可公开访问的URL
2. 登录 App Store Connect
3. 进入"App 隐私"页面
4. 在"隐私政策网址 (URL)"字段中输入您的隐私政策URL
5. 保存并提交审核