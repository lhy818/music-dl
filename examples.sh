#!/bin/bash
# go-music-dl 使用示例

# 示例 1: 基础搜索和下载
echo "示例 1: 搜索并下载歌曲"
echo "命令: music-dl -k '周杰伦 晴天'"
echo ""

# 示例 2: 指定平台
echo "示例 2: 从指定平台下载"
echo "命令: music-dl -k '晴天' -s qq,netease"
echo ""

# 示例 3: 无损下载 + 封面 + 歌词
echo "示例 3: 下载无损音乐（带封面和歌词）"
echo "命令: music-dl -k '周杰伦 晴天' --cover --lyrics -s netease"
echo ""

# 示例 4: 下载到指定目录
echo "示例 4: 下载到指定目录"
echo "命令: music-dl -k '周杰伦 晴天' -o ~/Music/downloads"
echo ""

# 示例 5: 歌单下载（链接）
echo "示例 5: 从歌单链接下载"
echo "命令: music-dl -k 'https://music.163.com/#/playlist?id=123456'"
echo ""

# 示例 6: 歌单下载（搜索）
echo "示例 6: 搜索歌单并进入 TUI 界面"
echo "命令: music-dl -k '周杰伦 热门歌单'"
echo "TUI 按键: 空格选择, Enter下载, q退出"
echo ""

# 示例 7: Web 模式
echo "示例 7: 启动 Web 界面"
echo "命令: music-dl web"
echo "访问: http://localhost:8080"
echo ""

# 示例 8: Docker 部署
echo "示例 8: Docker 零配置部署"
echo "命令:"
echo "  git clone https://github.com/guohuiyuan/go-music-dl.git"
echo "  cd go-music-dl"
echo "  docker compose up -d"
echo ""

# 实用提示
echo "=== 实用提示 ==="
echo ""
echo "🎵 支持无损的平台:"
echo "  - 网易云音乐 (netease)"
echo "  - QQ 音乐 (qq)"
echo "  - Bilibili (bilibili)"
echo "  - 酷狗音乐 (kugou，仅普通歌曲)"
echo ""
echo "🎧 获取更高音质:"
echo "  在 Web 界面设置中添加平台 Cookie"
echo ""
echo "🔄 换源功能:"
echo "  TUI 模式: 按 r 键批量换源"
echo "  Web 界面: 点击单曲卡片上的'换源'按钮"
echo ""
echo "📥 下载完成后:"
echo "  如果文件 ≤ 50MB: AI 助手会直接发送给你"
echo "  如果文件 > 50MB: AI 助手会上传到 PikPak 并发送链接"
echo ""
echo "📋 查看帮助:"
echo "  music-dl -h"
echo ""
