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
    echo "WHICH AWS"
    which aws
    echo "LS -LHA"
    ls -lha
    echo "LS -L"
    ls -l /usr/local/bin/aws
    echo "Installed version:"
    sudo sh -c "/usr/local/bin/aws --version"
else
    echo "AWS_CLI_VERSION environment variable wasn't recognized"
    echo "Installing AWS CLI latest version"
    pip3 --no-cache-dir install --upgrade awscli
    echo "Installed version:"
    sh -c "aws --version"
fi

echo "Executing command: aws $1"

sh -c "aws $1"