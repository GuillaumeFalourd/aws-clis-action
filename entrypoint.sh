#!/bin/bash

set -e

if [[ ! -z $AWS_CLI_VERSION && ${AWS_CLI_VERSION:0:2} == "1." ]]
then
    echo "Installing AWS CLI version $AWS_CLI_VERSION"
    pip3 --no-cache-dir install awscli==$AWS_CLI_VERSION
    echo "AWS version installed:"
    sh -c "aws --version"
elif [[ ! -z $AWS_CLI_VERSION && ${AWS_CLI_VERSION:0:2} == "2." ]]
then
    echo "Installing AWS CLI version $AWS_CLI_VERSION"
    curl -sL https://awscli.amazonaws.com/awscli-exe-linux-x86_64-$AWS_CLI_VERSION.zip -o awscliv2.zip \
    && unzip awscliv2.zip \
    && aws/install \
    && rm -rf \
    awscliv2.zip \
    aws \
    /usr/local/aws-cli/v2/*/dist/aws_completer \
    /usr/local/aws-cli/v2/*/dist/awscli/data/ac.index \
    /usr/local/aws-cli/v2/*/dist/awscli/examples \
    echo "AWS version installed:"
    sh -c "aws --version"
else
    echo "AWS_CLI_VERSION environment variable wasn't set or recognized"
    echo "Installing AWS CLI latest version (2)"
    curl -sL https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -o awscliv2.zip \
    && unzip awscliv2.zip \
    && aws/install \
    && rm -rf \
    awscliv2.zip \
    aws \
    /usr/local/aws-cli/v2/*/dist/aws_completer \
    /usr/local/aws-cli/v2/*/dist/awscli/data/ac.index \
    /usr/local/aws-cli/v2/*/dist/awscli/examples \
    echo "AWS version installed:"
    sh -c "aws --version"
fi

echo "Executing command: aws $1"

sh -c "aws $1"