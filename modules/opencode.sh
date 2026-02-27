#!/bin/bash
# 模块：OpenCode 开发环境
# 包含：opencode CLI、opencode-desktop、配置文件、skills、plugins

DOTFILES_DIR="$(cd "$(dirname "$0")/.." && pwd)"
OPENCODE_CONFIG="$HOME/.config/opencode"

echo ""
echo "========================================="
echo "  模块：OpenCode 开发环境"
echo "========================================="
echo ""

# ---- 1. 安装 opencode CLI 和桌面应用 ----
echo "[1/4] 安装 opencode..."
brew install opcode opencode-desktop
echo "  ✓ opcode 和 opencode-desktop 已安装"

# ---- 2. 配置目录 + 基础配置 ----
echo "[2/4] 配置 opencode..."
mkdir -p "$OPENCODE_CONFIG/plugins" "$OPENCODE_CONFIG/skills"

# 复制不含敏感信息的配置
cp "$DOTFILES_DIR/config/opencode/oh-my-opencode.jsonc" "$OPENCODE_CONFIG/"
cp "$DOTFILES_DIR/config/opencode/opencode.json" "$OPENCODE_CONFIG/"
cp "$DOTFILES_DIR/config/opencode/package.json" "$OPENCODE_CONFIG/"
cp "$DOTFILES_DIR/config/opencode/AGENTS.md" "$OPENCODE_CONFIG/"
echo "  ✓ 基础配置已复制"
# ---- 3. Skills + Plugins ----
echo "[3/4] 复制 skills 和 plugins..."
cp -r "$DOTFILES_DIR/config/opencode/skills/" "$OPENCODE_CONFIG/skills/"
cp -r "$DOTFILES_DIR/config/opencode/plugins/" "$OPENCODE_CONFIG/plugins/"
echo "  ✓ skills 和 plugins 已复制"
# ---- 4. opencode.jsonc（含 API Keys）----
echo "[4/4] 配置 opencode.jsonc..."
if [[ -f "$OPENCODE_CONFIG/opencode.jsonc" ]]; then
  echo "  → opencode.jsonc 已存在，跳过（避免覆盖你的 API Keys）"
else
  cp "$DOTFILES_DIR/config/opencode/opencode.jsonc.tpl" "$OPENCODE_CONFIG/opencode.jsonc"
  echo ""
  echo "  ⚠ opencode.jsonc 已从模板创建，需要手动填入 API Keys："
  echo "  编辑 ~/.config/opencode/opencode.jsonc"
  echo "  替换以下占位符："
  echo "    __NC_AWS_API_KEY__      → NC AWS / NC DROID / NC Codex 共用的 key"
  echo "    __MC_AWS_API_KEY__      → MC AWS 的 key"
  echo "    __RC_CODEX_API_KEY__    → RC Codex 的 key"
  echo "    __ZAI_GLM_API_KEY__     → ZAI GLM 的 key"
  echo "    __NCAPI_AWS_HIGH_API_KEY__ → NCAPI AWS High 的 key"
fi
echo ""
# ---- 5. 安装 npm 依赖 ----
echo "安装 opencode 插件依赖..."
if command -v npm &>/dev/null; then
  (cd "$OPENCODE_CONFIG" && npm install)
  echo "  ✓ npm 依赖已安装"
else
  echo "  ⚠ npm 未安装，请先安装 Node.js 后手动运行："
  echo "    cd ~/.config/opencode && npm install"
fi
echo ""
echo "✓ OpenCode 模块完成！"
