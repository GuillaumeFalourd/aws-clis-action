# AWS CLIs Action

[![AWS CLI V1.X.Y action](https://github.com/GuillaumeFalourd/aws-cli-action/actions/workflows/aws-cli-v1.X.Y.yml/badge.svg)](https://github.com/GuillaumeFalourd/aws-cli-action/actions/workflows/aws-cli-v1.X.Y.yml) [![AWS CLI V2.X.Y action](https://github.com/GuillaumeFalourd/aws-cli-action/actions/workflows/aws-cli-v2.X.Y.yml/badge.svg)](https://github.com/GuillaumeFalourd/aws-cli-action/actions/workflows/aws-cli-v2.X.Y.yml) [![AWS CLI Latest Version action](https://github.com/GuillaumeFalourd/aws-cli-action/actions/workflows/aws-cli-latest-version.yml/badge.svg)](https://github.com/GuillaumeFalourd/aws-cli-action/actions/workflows/aws-cli-latest-version.yml)

![AWS CLIs Action](https://user-images.githubusercontent.com/22433243/116742843-589d6800-a9ce-11eb-8cff-675a0d7cabde.png)

Github Action to use `any` version of AWS CLI to run `any` AWS CLI commands on your workflows.

## How to use this action?

Demonstration of how to execute the following command inside your workflow:

```bash
aws s3 ls
```

### Without credentials

```bash
- name: Run AWS CLI v2.2.0 commands
  uses: GuillaumeFalourd/aws-cli-action@main
  env:
    AWS_CLI_VERSION = "2.2.0" # If not informed, the latest AWS CLI version 2 will be used.
  with:
    args: s3 ls
```

### With credentials

It's also possible to pass the AWS credentials from GitHub secrets using the implementation below:

```bash
- name: Run AWS CLI v1.19.59 commands
  uses: GuillaumeFalourd/aws-cli-action@main
  env:
      AWS_CLI_VERSION: "1.19.59" # If not informed, the latest AWS CLI version 2 will be used.
      AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
      AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
      AWS_DEFAULT_REGION: "eu-west-1"
  with:
    args: s3 ls
```

## Licensed

This repository uses the [Apache License 2.0](https://github.com/GuillaumeFalourd/aws-cliaction/blob/main/LICENSE)
