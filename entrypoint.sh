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
    echo "Installed version:"
    sh -c "aws --version"
elif [[ ${AWS_CLI_VERSION:0:2} == "1." ]]
then
    echo "Installing AWS CLI version AWS_CLI_VERSION"
    pip3 --no-cache-dir install awscli==$AWS_CLI_VERSION
    echo "Installed version:"
    sh -c "aws --version"
elif [[ ${AWS_CLI_VERSION:0:2} == "2." ]]
then
    echo "Installing AWS CLI version AWS_CLI_VERSION"
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64-$AWS_CLI_VERSION.zip" -o "awscliv2.zip"
    unzip awscliv2.zip
    sudo ./aws/install
    echo "--> WHICH AWS"
    which aws
    echo "--> LS -LHA"
    ls -lha
    echo "--> PWD"
    pwd
    echo "--> LS -L /usr/local/bin/aws"
    ls -l /usr/local/bin/aws
    echo "--> LS -L /usr/local"
    ls -l /usr/local
    echo "--> LS -L /usr/local/bin"
    ls -l /usr/local/bin
    echo "--> LS -L /usr/local/aws-cli"
    ls -l /usr/local/aws-cli
    echo "--> aws-cli v2 bin"
    cd /usr/local/aws-cli/v2/current/bin/
    ls -l
    echo "Installed version:"
    sh -c "sudo aws --version"
else
    echo "AWS_CLI_VERSION environment variable wasn't recognized"
    echo "Installing AWS CLI latest version"
    pip3 --no-cache-dir install --upgrade awscli
    echo "Installed version:"
    sh -c "aws --version"
fi

echo "Executing command: aws $1"

sh -c "aws $1"