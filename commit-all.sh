#!/bin/sh

# 1. Stage all changes
git add .

# 2. Commit with an automatic timestamp message
COMMIT_MSG="auto-save: $(date '+%Y-%m-%d %H:%M:%S')"

# 3. Attempt to commit (this will trigger your size and branch checks!)
if git commit -m "$COMMIT_MSG"; then
    echo "⚡ Saved and Committed successfully!"
else
    echo "❌ Commit blocked by constraint checks."
fi