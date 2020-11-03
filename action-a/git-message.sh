#!/bin/bash
Git_Repo=$1
Git_Token=$2
Git_Current_Branch=$3
Git_Target_Branch=$4
Git_Commit_Message=$5
Git_PR_Num=$6

echo "values are:"
echo $Git_Target_Branch
echo $Git_Current_Branch
echo $Git_PR_Num

echo "https://api.github.com/repos/$Git_Repo/pulls/$Git_PR_Num/requested_reviewers"
          jq -nc '{"reviewers": ["saikarumuri"]}' | \
          curl -sL  -X POST -d @- \
            -H "Content-Type: application/json" \
            -H "Authorization: token $Git_Token" \
            "https://api.github.com/repos/$Git_Repo/pulls/$Git_PR_Num/requested_reviewers"

echo "https://api.github.com/repos/$Git_Repo/merges"
          jq -nc '{"base": "'"$Git_Target_Branch"'","head":"'"$Git_Current_Branch"'","commit_message":"'"$Git_Commit_Message"'"}' | \
          curl -sL  -X POST -d @- \
            -H "Content-Type: application/json" \
            -H "Authorization: token $Git_Token" \
            "https://api.github.com/repos/$Git_Repo/merges"