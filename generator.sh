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

SCRIPT_FULLPATH="$( readlink -f -- "${BASH_SOURCE[0]:-$0}" 2> '/dev/null'; )";
function DeleteSelf {
	echo -e "\n${CLR_SUCCESS}Successfully generated git repository from template ${TEMPLATE_BRANCH}, deleting generator script from template.${CLR_RESET}";
	rm -- "${SCRIPT_FULLPATH}"
}

# This ensures the script exits if any errors are met. We do not wish to continue if any git command fails
set -e

# Generate the repository from template
git fetch origin
git checkout "${TEMPLATE_BRANCH}"
#git reset --hard origin/"${TEMPLATE_BRANCH}"
git push origin HEAD:${MAIN_BRANCH} --force
git checkout "${MAIN_BRANCH}"

# Cleanup all local and remote branches besides the main one
git fetch --prune
git branch | grep -v "${MAIN_BRANCH}$" | xargs git branch -D
git branch -r --merged main | grep -v "${MAIN_BRANCH}$" | xargs -0 -- basename | xargs git push origin --delete
git fetch --prune

# When generaton is finished sucessfully, delete the generator
trap DeleteSelf EXIT
