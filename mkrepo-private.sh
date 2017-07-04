#!/bin/sh

if [ $# -ne 3 ]; then
  echo "[usage]" 1>&2
  echo 'mkrepo-public.sh {token} {repo_name} {repo_desc}' 1>&2
  exit 1
fi


TOKEN=$1
JSON="{\"name\": \"$2\", \"description\": \"$3\", \"private\": true}"

curl -i -H "Authorization: token ${TOKEN}" -d "${JSON}" https://api.github.com/user/repos;
