#!/bin/bash

COMMIT_MSG='AC ...'

if [ $# -gt 0 ]; then
    COMMIT_MSG="Add $1.swift"
fi

echo "- Add changed/new files."
git add .

echo "- Commit"
git commit -m "${COMMIT_MSG}"

echo "- Push to origin master"
git push origin master
