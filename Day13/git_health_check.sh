#!/bin/bash

echo "===================================="
echo "       GIT REPOSITORY HEALTH"
echo "===================================="

echo
echo "Current Branch:"
git branch --show-current

echo
echo "Working Tree:"
git status --short

echo
echo "Recent Commits:"
git log --oneline -5

echo
echo "Branches:"
git branch

echo
echo "Tags:"
git tag

echo
echo "Remote:"
git remote -v

echo
echo "Last Commit:"
git log -1 --format='%h - %s'

echo
echo "===================================="
