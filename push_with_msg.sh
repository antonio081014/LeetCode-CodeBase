#!/bin/bash

COMMIT_MSG='AC ...'

if [ $# -gt 0 ]; then
    COMMIT_MSG=$1
fi

echo "- Add changed/new files."
git add .

echo "- Commit"
git commit -m "${COMMIT_MSG}"

echo "- Push to origin HEAD"
# git push origin HEAD
