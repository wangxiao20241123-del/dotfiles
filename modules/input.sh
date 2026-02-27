#!/bin/bash
# 模块：输入法
# 包含：微信输入法（WeType）

echo ""
echo "========================================="
echo "  模块：输入法"
echo "========================================="
echo ""

echo "[1/1] 安装微信输入法..."
if brew list --cask wetype &>/dev/null; then
  echo "  ✓ 微信输入法已安装，跳过"
else
  brew install --cask wetype
  echo "  ✓ 微信输入法已安装"
fi

echo ""
echo "✓ 输入法模块完成！"
