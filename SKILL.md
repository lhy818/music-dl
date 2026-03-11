---
name: go-music-dl
description: 全网音乐搜索与下载工具，支持10+音乐平台（网易云、QQ音乐、酷狗、酷我、B站等），支持无损音乐下载、歌单下载、歌词封面提取。触发词：music-dl, 音乐下载, 歌曲下载, 搜索音乐, go-music-dl, 网易云, QQ音乐, 无损音乐, 歌单下载。
---

# go-music-dl - 全网音乐搜索与下载工具

Go Music DL 是一个基于 Go 语言的全网音乐搜索与下载工具，支持 10+ 个主流音乐平台，包括网易云、QQ音乐、酷狗、酷我、Bilibili、汽水音乐等。

## 支持的音乐平台

| 平台 | 包名 | 搜索 | 下载 | 歌词 | 歌单 | 备注 |
|------|------|------|------|------|------|------|
| 网易云音乐 | netease | ✅ | ✅ | ✅ | ✅ | 支持 FLAC 无损 |
| QQ 音乐 | qq | ✅ | ✅ | ✅ | ✅ | 支持 FLAC 无损 |
| 酷狗音乐 | kugou | ✅ | ✅ | ✅ | ✅ | 普通歌曲支持 FLAC |
| 酷我音乐 | kuwo | ✅ | ✅ | ✅ | ✅ | - |
| Bilibili | bilibili | ✅ | ✅ | ❌ | ✅ | 支持 FLAC 无损 |
| 汽水音乐 | soda | ✅ | ✅ | ✅ | ✅ | 音频解密 |
| 咪咕音乐 | migu | ✅ | ✅ | ✅ | ✅ | - |
| 5sing | fivesing | ✅ | ✅ | ✅ | ✅ | - |
| JOOX | joox | ✅ | ✅ | ✅ | ✅ | - |

## 前置条件

### 安装 FFmpeg（必需）

FFmpeg 是内嵌元数据（封面/歌词）的必需依赖：

```bash
# 检查是否已安装
ffmpeg -version

# Ubuntu/Debian
sudo apt install ffmpeg

# macOS
brew install ffmpeg

# Windows
winget install Gyan.FFmpeg
```

## 安装 go-music-dl

### 方式一：下载预编译二进制文件（推荐）

```bash
# 1. 访问 GitHub Releases 下载最新版本
# https://github.com/guohuiyuan/go-music-dl/releases

# 2. 根据系统选择对应版本下载：
#    - Linux: music-dl-linux-amd64
#    - macOS: music-dl-darwin-amd64
#    - Windows: music-dl-windows-amd64.exe

# 3. 重命名并添加到系统 PATH
mv music-dl-linux-amd64 music-dl
chmod +x music-dl
sudo mv music-dl /usr/local/bin/  # 或放到 PATH 中的其他目录
```

### 方式二：使用 Go 编译

```bash
# 安装 Go 后编译
git clone https://github.com/guohuiyuan/go-music-dl.git
cd go-music-dl
go build -o music-dl cmd/music-dl/main.go
sudo mv music-dl /usr/local/bin/
```

### 验证安装

```bash
music-dl -h
```

## 快速开始

### 1. 基础音乐搜索与下载

```bash
# 搜索并下载（默认标准音质）
music-dl -k "周杰伦 晴天"
```

### 2. 指定音乐源

```bash
# 从指定平台搜索
music-dl -k "晴天" -s qq,netease
```

### 3. 下载包含封面和歌词

```bash
music-dl -k "晴天" --cover --lyrics
```

### 4. 指定下载目录

```bash
music-dl -k "晴天" -o ~/Music/downloads
```

## 常用功能

### 1. 无损音乐下载（FLAC）

```bash
# 从支持无损的平台下载
music-dl -k "周杰伦" -s netease,qq
```

网易云、QQ音乐、Bilibili、酷狗（普通歌曲）支持 FLAC 无损下载。

### 2. 歌单下载

**通过歌单链接下载：**

```bash
# 网易云歌单
music-dl -k "https://music.163.com/#/playlist?id=123456"

# QQ音乐歌单
music-dl -k "https://y.qq.com/n/ryqq/playlist/123456"
```

**搜索歌单并下载：**

```bash
# 搜索后进入 TUI 界面批量选择下载
music-dl -k "周杰伦 热门歌单"
```

### 3. 歌曲链接解析

```bash
# 直接从歌曲链接下载
music-dl -k "https://music.163.com/#/song?id=123456"
```

支持链接解析的平台：网易云、QQ音乐、酷狗、酷我、咪咕、Bilibili、汽水音乐、5sing、Jamendo。

### 4. 批量下载（TUI 模式）

```bash
# 进入 TUI 界面
music-dl -k "周杰伦"

# TUI 常用按键：
# ↑/↓   : 移动选择
# 空格   : 选择/取消选择
# a     : 全选/清空
# Enter : 下载选中歌曲
# r     : 对勾选项换源
# w     : 每日推荐歌单
# q     : 退出
```

### 5. 换源功能

当一个源下载失败或质量不佳时，可以换源：

```bash
# TUI 模式下按 r 键批量换源
# Web 界面点击"换源"按钮
```

换源会自动排除 soda 和 fivesing。

### 6. 每日推荐歌单

```bash
# TUI 模式按 w 键查看每日推荐
# Web 界面点击"每日推荐"
```

每日推荐会聚合网易云、QQ、酷狗、酷我的推荐歌单。

### 7. 指定输出格式和目录

```bash
# 指定输出文件名格式
music-dl -k "周杰伦" -o "%(artist)s - %(title)s.%(ext)s"

# 指定下载目录
music-dl -k "周杰伦" -o ~/Music/my-playlist
```

## Web 模式

### 启动 Web 服务

```bash
# 默认端口 8080
music-dl web

# 访问 http://localhost:8080
```

### Web 模式功能

- 🎵 音乐搜索与试听
- 📋 歌单管理与自制歌单
- 🎧 试听、歌词、封面显示
- 🔄 换源功能
- 📥 批量下载
- ⚙️ 设置 Cookie 获取更高音质
- 📊 每日推荐歌单

### Web 内嵌元数据设置

Web 端"设置"里可开启"下载时内嵌元数据（封面/歌词）"：

- **默认关闭（推荐）**：流式下载，速度快，支持断点续传
- **开启后**：下载时会嵌入封面和歌词到音频文件

⚠️ 开启内嵌需要 FFmpeg。

## Docker 部署（零配置）

### 生产环境部署

```bash
# 拉取 docker-compose.yml
git clone https://github.com/guohuiyuan/go-music-dl.git
cd go-music-dl

# 后台启动服务（零配置）
docker compose up -d

# 查看日志
docker compose logs -f

# 停止服务
docker compose down
```

浏览器访问 http://localhost:8080。

### Docker 命名卷说明

- `music_data_downloads`: 下载的音乐文件
- `music_data_cookies`: Cookie 配置文件
- `music_data_favorites`: 自制歌单 SQLite 数据库

## 高级功能

### 1. Cookie 配置（获取更高音质）

在 Web 界面"设置"中添加各平台的 Cookie，可以获取更高音质的音乐资源。

### 2. 音频解密（汽水音乐）

汽水音乐等加密音频会自动解密下载。

### 3. 过滤付费资源

系统会自动过滤需要付费的资源。

### 4. Range 探测

显示音乐文件大小和码率，支持断点续传和拖动播放。

## 使用流程（AI 助手工作流）

当用户请求下载音乐时：

1. **确认需求**：
   - 搜索关键词或歌曲链接
   - 指定平台（可选）
   - 是否需要无损音质
   - 是否需要歌词和封面

2. **选择下载方式**：
   - 单首歌曲：`music-dl -k "歌曲名"`
   - 歌单：`music-dl -k "歌单链接"`
   - 批量下载：TUI 模式

3. **执行下载**：
   ```bash
   # 基础下载
   music-dl -k "周杰伦 晴天" -o ~/Music/downloads

   # 无损 + 封面 + 歌词
   music-dl -k "周杰伦 晴天" --cover --lyrics -s netease
   ```

4. **自动发送文件**（重要）：
   - 下载完成后，检查文件大小
   - 如果 ≤ 50MB：立即使用 `message` 工具发送给用户
   - 如果 > 50MB：上传到 PikPak 并发送下载链接
   - 只在文件交付完成后报告成功

5. **报告结果**：
   - 确认文件已发送
   - 告知文件位置
   - 报告任何错误

## 示例交互

**用户**: "帮我下载周杰伦的晴天"

**AI 响应**:
```bash
# 下载歌曲（默认标准音质）
music-dl -k "周杰伦 晴天" -o ~/Music/downloads

# 下载完成后，发送给用户
message(action="send", filePath="~/Music/downloads/周杰伦 - 晴天.mp3", message="这是您请求下载的歌曲")
```

**用户**: "下载这个歌单 https://music.163.com/#/playlist?id=123456，只要无损音质"

**AI 响应**:
```bash
# 从网易云歌单链接下载
music-dl -k "https://music.163.com/#/playlist?id=123456" --cover --lyrics -o ~/Music/playlists

# 下载完成后，打包并发送给用户（如果 ≤ 50MB）
# 或上传到 PikPak 发送链接（如果 > 50MB）
```

**用户**: "搜索一首歌，名字是稻香，从QQ音乐下载"

**AI 响应**:
```bash
# 从QQ音乐下载
music-dl -k "稻香" -s qq --cover --lyrics -o ~/Music/downloads

# 下载完成后发送给用户
```

## 常见问题

### Q: 某首歌下载失败？

**原因**：
- 付费资源限制
- 平台接口变更
- 网络问题

**解决方案**：
- 尝试换源（TUI 按 r，Web 点击换源）
- 添加 Cookie 获取更高权限
- 尝试其他平台

### Q: 如何获取无损音乐？

**方案**：
```bash
# 从支持无损的平台下载
music-dl -k "歌曲名" -s netease,qq,qqmusic
```

网易云、QQ音乐、Bilibili、酷狗（普通歌曲）支持 FLAC 无损。

### Q: 下载的文件没有歌词或封面？

**原因**：
- FFmpeg 未安装
- 内嵌元数据未开启

**解决方案**：
```bash
# 安装 FFmpeg
sudo apt install ffmpeg  # Ubuntu/Debian
brew install ffmpeg      # macOS

# 下载时开启内嵌
music-dl -k "歌曲名" --cover --lyrics
```

### Q: Web 模式打不开？

**原因**：
- 端口被占用
- 浏览器插件拦截

**解决方案**：
```bash
# 检查端口占用
lsof -i :8080

# 使用其他端口
music-dl web -p 8081
```

### Q: 桌面应用无法启动？

**原因**：未安装 WebView2 运行时（Windows）

**解决方案**：
从 [Microsoft官网](https://developer.microsoft.com/microsoft-edge/webview2/) 下载安装 WebView2。

## 最佳实践

1. **无损下载**：优先选择 netease、qq、bilibili
2. **批量下载**：使用 TUI 模式（`music-dl -k "关键词"`）
3. **歌单管理**：使用 Web 界面创建自制歌单
4. **音质提升**：在 Web 端设置中添加 Cookie
5. **自动发送**：下载完成后立即发送文件给用户，不要等待
6. **大文件处理**：> 50MB 使用 PikPak，≤ 50MB 直接发送
7. **FFmpeg 依赖**：确保已安装 FFmpeg 以支持内嵌元数据

## 许可证

本项目遵循 GNU Affero General Public License v3.0（AGPL-3.0）。

## 免责声明

仅供学习和技术交流使用。下载的音乐资源请在 24 小时内删除。
