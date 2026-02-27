#!/bin/bash
set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "========================================="
echo "  Mac 开发环境迁移"
echo "========================================="
echo ""
echo "可用模块："
echo "  1) github    - Git + GitHub CLI + SSH 密钥"
echo "  2) opencode  - OpenCode CLI + 配置"
echo "  3) input     - 微信输入法（WeType）"
echo "  a) all       - 全部安装"
echo ""
read -p "选择要安装的模块 (1/2/3/a): " choice

run_module() {
  local module="$1"
  local script="$DOTFILES_DIR/modules/${module}.sh"
  if [[ ! -f "$script" ]]; then
    echo "错误：模块 $module 不存在"
    return 1
  fi
  bash "$script"
}

case "$choice" in
  1) run_module "github" ;;
  2) run_module "opencode" ;;
  3) run_module "input" ;;
  a|A) run_module "github" && run_module "opencode" && run_module "input" ;;
  *) echo "无效选择"; exit 1 ;;
esac

echo ""
echo "========================================="
echo "  ✓ 迁移完成！"
echo "========================================="
