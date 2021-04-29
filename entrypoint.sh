#!/bin/bash

set -e

#if [[ -z $AWS_CLI_VERSION ]]
#then
#    echo "AWS_CLI_VERSION environment variable isn't set."
#    echo "Installing AWS CLI latest version"
#    pip3 --no-cache-dir install --upgrade awscli
#else
#    echo "Installing AWS CLI version AWS_CLI_VERSION"
#    pip3 --no-cache-dir install awscli==$AWS_CLI_VERSION
#fi

if [[ -z $AWS_CLI_VERSION ]]
then
    echo "AWS_CLI_VERSION environment variable isn't set."
    echo "Installing AWS CLI latest version"
    pip3 --no-cache-dir install --upgrade awscli
    aws --version
elif [[ ${AWS_CLI_VERSION:0:2} == "1." ]]
then
    echo "Installing AWS CLI version AWS_CLI_VERSION"
    pip3 --no-cache-dir install awscli==$AWS_CLI_VERSION
    aws --version
elif [[ ${AWS_CLI_VERSION:0:2} == "2." ]]
then
    echo "Installing AWS CLI version AWS_CLI_VERSION"
    pip install aws-shell
    aws-shell --version
else
    echo "AWS_CLI_VERSION environment variable wasn't recognized"
    echo "Installing AWS CLI latest version"
    pip3 --no-cache-dir install --upgrade awscli
    aws --version
fi

echo "Executing command: aws $1"

sh -c "aws $1"