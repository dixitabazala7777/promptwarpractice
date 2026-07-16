#!/bin/sh

# 1. Stage all changes
git add .

# 2. Commit with an automatic timestamp message
COMMIT_MSG="auto-save: $(date '+%Y-%m-%d %H:%M:%S')"

# 3. Attempt to commit (checks size and branch rules first)
if git commit -m "$COMMIT_MSG"; then
    echo "⚡ Saved and Committed locally!"
    
    # 4. Automatically push to GitHub
    echo "Uploading to GitHub..."
    if git push; then
        echo "🚀 Uploaded to GitHub successfully!"
    else
        echo "❌ Push to GitHub failed (Check your internet or repository setup)."
    fi
else
    echo "❌ Commit blocked by constraint checks."
fi 