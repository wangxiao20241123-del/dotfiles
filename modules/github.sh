#!/bin/bash
# 模块：GitHub 开发环境
# 包含：Homebrew、git、gh、.gitconfig、SSH 配置、SSH 密钥生成

DOTFILES_DIR="$(cd "$(dirname "$0")/.." && pwd)"

echo ""
echo "========================================="
echo "  模块：GitHub 开发环境"
echo "========================================="
echo ""

# ---- 1. Homebrew ----
echo "[1/6] 检查 Homebrew..."
if ! command -v brew &>/dev/null; then
  echo "  → 安装 Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  if [[ -f /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
    echo '# Homebrew' >> ~/.zprofile
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
  fi
else
  echo "  ✓ Homebrew 已安装"
fi

# ---- 2. Git + GitHub CLI ----
echo "[2/6] 安装 git 和 gh..."
brew install git gh
echo "  ✓ git $(git --version | awk '{print $3}')"
echo "  ✓ gh $(gh --version | head -1 | awk '{print $3}')"

# ---- 3. .gitconfig ----
echo "[3/6] 配置 .gitconfig..."
if [[ -f ~/.gitconfig ]]; then
  echo "  → 已存在，备份为 ~/.gitconfig.bak"
  cp ~/.gitconfig ~/.gitconfig.bak
fi
cp "$DOTFILES_DIR/config/.gitconfig" ~/.gitconfig
echo "  ✓ .gitconfig 已配置"

# ---- 4. SSH 目录 + 配置 ----
echo "[4/6] 配置 SSH..."
mkdir -p ~/.ssh
chmod 700 ~/.ssh
if [[ -f ~/.ssh/config ]]; then
  if grep -q "github.com" ~/.ssh/config; then
    echo "  → SSH config 已包含 GitHub 配置，跳过"
  else
    echo "  → 追加 GitHub 配置到 ~/.ssh/config"
    echo "" >> ~/.ssh/config
    cat "$DOTFILES_DIR/config/ssh_config_github" >> ~/.ssh/config
  fi
else
  cp "$DOTFILES_DIR/config/ssh_config_github" ~/.ssh/config
fi
chmod 600 ~/.ssh/config
echo "  ✓ SSH config 已配置"
# ---- 5. 生成 SSH 密钥 ----
echo "[5/6] 生成 SSH 密钥..."
if [[ -f ~/.ssh/id_ed25519 ]]; then
  echo "  → ~/.ssh/id_ed25519 已存在，跳过生成"
else
  ssh-keygen -t ed25519 -C "wangxiao20241123@gmail.com" -f ~/.ssh/id_ed25519 -N ""
  echo "  ✓ 密钥已生成"
fi
eval "$(ssh-agent -s)" >/dev/null 2>&1
ssh-add --apple-use-keychain ~/.ssh/id_ed25519 2>/dev/null
echo "  ✓ 密钥已添加到 ssh-agent"

# ---- 6. 验证 ----
echo "[6/6] 验证..."
echo ""
echo "========================================="
echo "  你的公钥（复制到 GitHub Settings → SSH Keys）："
echo "========================================="
echo ""
cat ~/.ssh/id_ed25519.pub
echo ""
echo "========================================="
echo ""
echo "添加公钥后，运行以下命令验证连接："
echo "  ssh -T git@github.com"
echo ""
echo "✓ GitHub 模块完成！"
