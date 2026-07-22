#!/usr/bin/env bash
cmd=$(jq -r '.tool_input.command // empty')
deny='(rm -rf (/|~|\$HOME)|git push .*(-f|--force).* (main|master)|drop (database|table)|db:?reset.*prod|mkfs|:\(\)\{)'
if echo "$cmd" | grep -qiE "$deny"; then
  echo "BLOCKED by policy: '$cmd' matches a destructive pattern. If genuinely intended, the human runs it." >&2
  exit 2
fi
exit 0
