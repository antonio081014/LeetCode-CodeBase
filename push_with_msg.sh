#!/bin/bash

COMMIT_MSG='AC ...'

if [ $# -gt 0 ]; then
    COMMIT_MSG="$1"
fi

# echo "message: ${COMMIT_MSG}"

git add .

git commit -m "${COMMIT_MSG}"

git push origin master

