#!/bin/bash
Git_Repo=$1
Git_Token=$2

echo "https://api.github.com/repos/$Git_Repo/merges"
          jq -nc '{"base": "master","head":"testpr","commit_message":"My First PR merge"}' | \
          curl -sL  -X POST -d @- \
            -H "Content-Type: application/json" \
            -H "Authorization: token $Git_Token" \
            "https://api.github.com/repos/$Git_Repo/merges"