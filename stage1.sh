#!/usr/bin/env bash

echo "Enter a message:"

read -r string

re='^[A-Z ]+$'
if [[ "$string" =~ $re ]]; then
    echo "This is a valid message!"
else
    echo "This is not a valid message!"
fi
