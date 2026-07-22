#!/usr/bin/env bash
# PreToolUse gate for Edit|Write. Exit 2 blocks the call.
f=$(jq -r '.tool_input.file_path // empty')
case "$f" in
  */migrations/*|*.lock|*lockfile*|*.env*|*/prod*.y*ml)
    echo "BLOCKED: $f is protected. Ask the human, or edit via an explicit migration workflow." >&2
    exit 2 ;;
esac
exit 0
