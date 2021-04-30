#!/bin/bash

set -e

installAwsVersionOne() {
    pip3 --no-cache-dir install awscli==$1
}

installAwsVersionTwo() {
    if [[ ! -z $AWS_CLI_VERSION && ${AWS_CLI_VERSION:0:2} == "2." ]]
    then
        curl -sL https://awscli.amazonaws.com/awscli-exe-linux-x86_64-$1.zip -o awscliv2.zip
    else
        curl -sL https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -o awscliv2.zip
    fi
    unzip awscliv2.zip \
    && aws/install \
    && rm -rf \
    awscliv2.zip \
    aws \
    /usr/local/aws-cli/v2/*/dist/aws_completer \
    /usr/local/aws-cli/v2/*/dist/awscli/data/ac.index \
    /usr/local/aws-cli/v2/*/dist/awscli/examples \
}

if [[ ! -z $AWS_CLI_VERSION && ${AWS_CLI_VERSION:0:2} == "1." ]]
then
    echo "Installing AWS CLI version $AWS_CLI_VERSION"
    installAwsVersionOne $AWS_CLI_VERSION
    echo "AWS version installed:"
    sh -c "aws --version"
elif [[ ! -z $AWS_CLI_VERSION && ${AWS_CLI_VERSION:0:2} == "2." ]]
then
    echo "Installing AWS CLI version $AWS_CLI_VERSION"
    installAwsVersionTwo $AWS_CLI_VERSION
    echo "AWS version installed:"
    sh -c "aws --version"
else
    echo "AWS_CLI_VERSION environment variable wasn't set or recognized"
    echo "Installing AWS CLI latest version (2)"
    installAwsVersionTwo
    echo "AWS version installed:"
    sh -c "aws --version"
fi

echo "Executing command: aws $1"

sh -c "aws $1"