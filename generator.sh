#!/bin/bash

# Colors for the output text
CLR_SUCCESS="\033[0;32m"
CLR_FAIL="\033[0;31m"
CLR_RESET="\033[0m"

# This file is for operating systems that can use BASH, if you are on windows prefer to use `generator.bat`
if [ -z "$1" ]
    then
        echo -e "${CLR_FAIL}No arguments given, please ensure you supply the branch you wish to get from the template.${CLR_RESET} Hint: ./generator.sh \"main\"";
        exit;
fi

TEMPLATE_BRANCH="${1:-main}"
MAIN_BRANCH="main"

# This ensures the script exits if any errors are met. We do not wish to continue if any git command fails
set -e

# Generate the repository from template
git checkout "${TEMPLATE_BRANCH}"
git push origin HEAD:${MAIN_BRANCH} --force
git checkout "${MAIN_BRANCH}"

# Cleanup all local and remote branches besides the main one
git branch | grep -v "${MAIN_BRANCH}$" | xargs git branch -D
git branch -r | grep -v "${MAIN_BRANCH}$" | xargs -0 -- basename | xargs git push origin --delete
git fetch --prune

# When generaton is finished sucessfully reset to the new main branch and thus delete this script
git reset --hard "origin/${MAIN_BRANCH}"
