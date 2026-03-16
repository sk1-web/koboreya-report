#!/bin/bash
# こぼれや GitHub プッシュスクリプト
# 使い方: このファイルをダブルクリック or Terminal で bash push_to_github.sh

TOKEN="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"
REPO="https://sk1-web:${TOKEN}@github.com/sk1-web/koboreya-report.git"

# スクリプトのある場所に移動
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR"

echo "📦 リポジトリをクローン中..."
git clone "$REPO" /tmp/koboreya-push 2>/dev/null || (cd /tmp/koboreya-push && git pull)
cd /tmp/koboreya-push

echo "📋 ファイルをコピー中..."
cp "$SCRIPT_DIR/index.html" .
cp "$SCRIPT_DIR/koboreya_issues_report.html" .
cp "$SCRIPT_DIR/接客マニュアル_こぼれや.pptx" . 2>/dev/null || true

echo "🚀 GitHubにプッシュ中..."
git config user.email "sk1.v.1@icloud.com"
git config user.name "satoshi"
git add -A
git commit -m "Update portal: fix bugs + add quiz + advice tab + remove game"
git push origin main

echo ""
echo "✅ 完了！"
echo "🌐 https://sk1-web.github.io/koboreya-report/"
