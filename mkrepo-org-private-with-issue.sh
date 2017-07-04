#!/bin/sh

if [ $# -ne 4 ]; then
  echo "[usage]" 1>&2
  echo 'mkrepo-public.sh {token} {repo_name} {repo_desc} {ORG}' 1>&2
  exit 1
fi


TOKEN=$1
ISSUE_JSON="{\"title\": \"CREATE NEW RIPOSITORY:$2\",
             \"body\": \"$3\",
            \"labels\": \"new repository\"}"
REPO_JSON="{\"name\": \"$2\", \"description\": \"$3\", \"private\": true}"

curl -i -H "Authorization: token ${TOKEN}" -d "${ISSUE_JSON}" https://api.github.com/repos/${ORG}/${ISSUE_REPO}/issues
curl -i -H "Authorization: token ${TOKEN}" -d "${REPO_JSON}" https://api.github.com/orgs/${ORG}/repos
