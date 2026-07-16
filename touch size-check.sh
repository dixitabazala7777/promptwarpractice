#!/bin/sh

# 1. BRANCH CHECK
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
if [ "$CURRENT_BRANCH" != "main" ] && [ "$CURRENT_BRANCH" != "master" ]; then
    echo "❌ COMMIT REJECTED! Only ONE branch allowed (main/master)."
    exit 1
fi

# 2. SIZE CHECK (10 MB = 10240 KB)
MAX_SIZE=10240
TOTAL_SIZE=$(git ls-files -z | xargs -0 du -ck | tail -n 1 | cut -f1)

if [ "$TOTAL_SIZE" -ge "$MAX_SIZE" ]; then
    echo "❌ COMMIT REJECTED! Size exceeds 10 MB."
    exit 1
fi

echo "✅ All constraints passed! Proceeding..."save