#!/bin/sh
# Link commands and rules into ~/.claude. Never overwrites existing files.
set -eu

src=$(cd "$(dirname "$0")" && pwd)
dest="$HOME/.claude"
mkdir -p "$dest/commands"

link() {
  if [ -e "$2" ] || [ -L "$2" ]; then
    echo "skip (exists): $2"
  else
    ln -s "$1" "$2"
    echo "linked: $2"
  fi
}

for file in "$src"/commands/*.md; do
  link "$file" "$dest/commands/$(basename "$file")"
done
link "$src/rules.md" "$dest/workflow-rules.md"

import="@workflow-rules.md"
if ! grep -qxF "$import" "$dest/CLAUDE.md" 2>/dev/null; then
  printf '\n%s\n' "$import" >> "$dest/CLAUDE.md"
  echo "added $import to $dest/CLAUDE.md"
fi
