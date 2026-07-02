#!/usr/bin/env bash
# agent-sync.sh — run this to link this repo's agents into ~/.kiro/agents/
set -euo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
echo "REPO: $REPO"
DEST="$HOME/.kiro/agents"
mkdir -p "$DEST"

for src in "$REPO"/agents/*.md "$REPO"/agents/*.json; do
  [ -e "$src" ] || continue          # skip if no matches
  name="$(basename "$src")"
  link="$DEST/$name"

  # back up a real file that's in the way; leave existing correct symlinks alone
  if [ -e "$link" ] && [ ! -L "$link" ]; then
    mv "$link" "$link.bak.$(date +%s)"
    echo "backed up existing $name"
  fi

  ln -sfn "$src" "$link"
  echo "linked $name"
done

echo "done. run: kiro-cli agent list"

