#!/bin/bash
Git_Repo=$1
Git_Token=$2
Git_Current_Branch=$3
Git_Target_Branch=$4

echo "https://api.github.com/repos/$Git_Repo/merges"
          jq -nc '{"base": "'"Git_Target_Branch"'","head":"'"Git_Current_Branch"'","commit_message":"My First PR merge"}' | \
          curl -sL  -X POST -d @- \
            -H "Content-Type: application/json" \
            -H "Authorization: token $Git_Token" \
            "https://api.github.com/repos/$Git_Repo/merges"