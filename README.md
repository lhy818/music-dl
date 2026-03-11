# go-music-dl Skill

OpenClaw skill for [go-music-dl](https://github.com/guohuiyuan/go-music-dl) - 全网音乐搜索与下载工具。

## 功能特性

- ✅ 支持 10+ 音乐平台（网易云、QQ音乐、酷狗、酷我、B站等）
- ✅ 无损音乐下载（FLAC）
- ✅ 歌单批量下载
- ✅ 歌词、封面提取
- ✅ 换源功能
- ✅ Web 界面、TUI 终端、桌面应用
- ✅ Docker 零配置部署
- ✅ 自动文件发送（≤ 50MB 直接发送，> 50MB 使用 PikPak）

## 安装

### 1. 安装 FFmpeg（必需）

```bash
# Ubuntu/Debian
sudo apt install ffmpeg

# macOS
brew install ffmpeg

# Windows
winget install Gyan.FFmpeg
```

### 2. 下载 go-music-dl

访问 [GitHub Releases](https://github.com/guohuiyuan/go-music-dl/releases) 下载对应系统的二进制文件，或使用 Go 编译：

```bash
git clone https://github.com/guohuiyuan/go-music-dl.git
cd go-music-dl
go build -o music-dl cmd/music-dl/main.go
sudo mv music-dl /usr/local/bin/
```

### 3. 验证安装

```bash
music-dl -h
```

## 使用示例

### 搜索并下载单首歌曲

```bash
music-dl -k "周杰伦 晴天"
```

### 从指定平台下载

```bash
music-dl -k "晴天" -s qq,netease
```

### 下载无损音乐 + 封面 + 歌词

```bash
music-dl -k "周杰伦" --cover --lyrics -s netease
```

### 下载歌单

```bash
music-dl -k "https://music.163.com/#/playlist?id=123456"
```

### 启动 Web 界面

```bash
music-dl web
# 访问 http://localhost:8080
```

### Docker 部署

```bash
git clone https://github.com/guohuiyuan/go-music-dl.git
cd go-music-dl
docker compose up -d
```

## 触发词

- music-dl
- 音乐下载
- 歌曲下载
- 搜索音乐
- go-music-dl
- 网易云
- QQ音乐
- 无损音乐
- 歌单下载

## AI 助手集成

当用户请求下载音乐时，AI 助手会：

1. 确认搜索关键词或歌曲链接
2. 执行下载命令
3. 下载完成后自动发送文件给用户（≤ 50MB）
4. 如果文件 > 50MB，上传到 PikPak 并发送链接

### 示例交互

**用户**: "帮我下载周杰伦的晴天"

**AI**:
```bash
music-dl -k "周杰伦 晴天" -o ~/Music/downloads
# 下载完成后自动发送
```

**用户**: "下载这个歌单 https://music.163.com/#/playlist?id=123456"

**AI**:
```bash
music-dl -k "https://music.163.com/#/playlist?id=123456" -o ~/Music/playlists
# 下载完成后自动发送
```

## 支持的音乐平台

| 平台 | 包名 | 无损 | 歌单 |
|------|------|------|------|
| 网易云音乐 | netease | ✅ | ✅ |
| QQ 音乐 | qq | ✅ | ✅ |
| 酷狗音乐 | kugou | ✅ | ✅ |
| 酷我音乐 | kuwo | - | ✅ |
| Bilibili | bilibili | ✅ | ✅ |
| 汽水音乐 | soda | - | ✅ |
| 咪咕音乐 | migu | - | ✅ |

## 常见问题

### Q: 下载失败怎么办？

尝试换源：
```bash
# TUI 模式按 r 键
# Web 界面点击换源按钮
```

### Q: 如何获取无损音乐？

指定支持无损的平台：
```bash
music-dl -k "歌曲名" -s netease,qq
```

### Q: 下载的文件没有歌词或封面？

确保安装了 FFmpeg：
```bash
ffmpeg -version
```

## 许可证

本项目遵循 GNU Affero General Public License v3.0（AGPL-3.0）。

## 免责声明

仅供学习和技术交流使用。下载的音乐资源请在 24 小时内删除。

## 参考链接

- [GitHub 仓库](https://github.com/guohuiyuan/go-music-dl)
- [在线文档](https://github.com/guohuiyuan/go-music-dl)
- [更新日志](https://github.com/guohuiyuan/go-music-dl/releases)
