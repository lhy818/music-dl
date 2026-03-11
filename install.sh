#!/bin/bash
# go-music-dl 安装脚本

set -e

echo "🎵 go-music-dl 安装脚本"
echo "======================"

# 检测操作系统
OS="$(uname -s)"
ARCH="$(uname -m)"

case "$OS" in
    Linux*)
        PLATFORM="linux"
        ;;
    Darwin*)
        PLATFORM="darwin"
        ;;
    MINGW*|MSYS*|CYGWIN*)
        PLATFORM="windows"
        ;;
    *)
        echo "❌ 不支持的操作系统: $OS"
        exit 1
        ;;
esac

case "$ARCH" in
    x86_64|amd64)
        ARCH_SUFFIX="amd64"
        ;;
    arm64|aarch64)
        ARCH_SUFFIX="arm64"
        ;;
    i386|i686)
        ARCH_SUFFIX="386"
        ;;
    *)
        echo "❌ 不支持的架构: $ARCH"
        exit 1
        ;;
esac

echo "📊 检测到系统: $OS $ARCH"

# 检查 FFmpeg
echo ""
echo "🔍 检查 FFmpeg..."
if command -v ffmpeg >/dev/null 2>&1; then
    echo "✅ FFmpeg 已安装: $(ffmpeg -version | head -n 1)"
else
    echo "⚠️  FFmpeg 未安装，正在安装..."
    if command -v apt-get >/dev/null 2>&1; then
        sudo apt-get update && sudo apt-get install -y ffmpeg
    elif command -v brew >/dev/null 2>&1; then
        brew install ffmpeg
    elif command -v winget >/dev/null 2>&1; then
        winget install Gyan.FFmpeg
    else
        echo "❌ 无法自动安装 FFmpeg，请手动安装:"
        echo "   Ubuntu/Debian: sudo apt install ffmpeg"
        echo "   macOS: brew install ffmpeg"
        echo "   Windows: winget install Gyan.FFmpeg"
        exit 1
    fi
fi

# 获取最新版本
echo ""
echo "🔍 获取最新版本..."
LATEST_VERSION=$(curl -s https://api.github.com/repos/guohuiyuan/go-music-dl/releases/latest | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')

if [ -z "$LATEST_VERSION" ]; then
    echo "❌ 无法获取最新版本"
    exit 1
fi

echo "📦 最新版本: $LATEST_VERSION"

# 构建下载 URL
if [ "$PLATFORM" = "windows" ]; then
    FILENAME="music-dl-${PLATFORM}-${ARCH_SUFFIX}.exe"
else
    FILENAME="music-dl-${PLATFORM}-${ARCH_SUFFIX}"
fi

DOWNLOAD_URL="https://github.com/guohuiyuan/go-music-dl/releases/download/${LATEST_VERSION}/${FILENAME}"

echo ""
echo "⬇️  下载 $FILENAME..."

# 下载文件
if command -v wget >/dev/null 2>&1; then
    wget -O music-dl "$DOWNLOAD_URL"
elif command -v curl >/dev/null 2>&1; then
    curl -L -o music-dl "$DOWNLOAD_URL"
else
    echo "❌ 未找到 wget 或 curl"
    exit 1
fi

# 添加执行权限
if [ "$PLATFORM" != "windows" ]; then
    chmod +x music-dl
fi

# 安装到系统路径
echo ""
echo "📥 安装到系统路径..."

if [ "$PLATFORM" = "windows" ]; then
    # Windows: 复制到当前目录或添加到 PATH 的目录
    echo "✅ 已下载到: $(pwd)/music-dl.exe"
    echo "📝 请将 $(pwd) 添加到系统 PATH，或手动复制到 PATH 目录"
else
    # Linux/macOS: 安装到 /usr/local/bin
    sudo mv music-dl /usr/local/bin/
    echo "✅ 已安装到: /usr/local/bin/music-dl"
fi

# 验证安装
echo ""
echo "🔍 验证安装..."
if command -v music-dl >/dev/null 2>&1; then
    echo "✅ 安装成功!"
    echo ""
    echo "📋 版本信息:"
    music-dl -v 2>/dev/null || music-dl --version 2>/dev/null || echo "(版本信息获取失败，但程序已安装)"
    echo ""
    echo "🚀 快速开始:"
    echo "   搜索并下载: music-dl -k \"歌曲名\""
    echo "   启动 Web: music-dl web"
    echo "   查看帮助: music-dl -h"
else
    echo "⚠️  程序已下载，但可能未在 PATH 中"
    echo "   Windows: 请将程序所在目录添加到 PATH"
    echo "   Linux/macOS: 检查 /usr/local/bin 是否在 PATH 中"
fi

echo ""
echo "🎉 安装完成!"
