#!/bin/zsh
# Airgent 起動スクリプト
# ターミナルウィンドウを2つ開いて opencode serve と airgent を起動する

AIRGENT_DIR="$HOME/ai/airgent"
SHELL_INIT="source ~/.zshrc"

osascript <<EOF
tell application "Terminal"
  activate

  -- ウィンドウ1: opencode serve
  do script "$SHELL_INIT && echo '=== OpenCode Server ===' && opencode serve"

  -- ウィンドウ2: airgent
  delay 2
  do script "$SHELL_INIT && echo '=== Airgent ===' && cd $AIRGENT_DIR && bun run index.ts"
end tell
EOF
