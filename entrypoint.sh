#!/bin/bash

set -e

if [[ -z $AWS_CLI_VERSION ]]
then
    echo "AWS_CLI_VERSION environment variable isn't set."
    echo "Installing AWS CLI latest version"
    sudo pip3 --no-cache-dir install --upgrade awscli
else
    echo "Installing AWS CLI version AWS_CLI_VERSION"
    sudo pip3 --no-cache-dir install awscli==$AWS_CLI_VERSION
fi

echo "Executing command: aws $1"

sudo sh -c "aws $1"