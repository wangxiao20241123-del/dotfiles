# dotfiles

Mac 开发环境迁移脚本。新机器上打开终端：

```bash
git clone https://github.com/wangxiao20241123-del/dotfiles.git ~/dotfiles
cd ~/dotfiles
./bootstrap.sh
```

## 模块

| 模块 | 内容 |
|------|------|
| github | Homebrew + Git + GitHub CLI + SSH 密钥 + .gitconfig |
| opencode | OpenCode CLI + 桌面应用 + 配置 + skills + plugins |

## 注意

- `opencode.jsonc` 含 API Keys，仓库里只存模板（`.tpl`），需手动填入
