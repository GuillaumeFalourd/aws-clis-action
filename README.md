# AWS CLI action

Github Action using AWS CLI v1 or v2 to run any of the AWS CLI commands on your workflows.

## How to use it?

This action uses the base image from AWS and simply providing a dockerised interface to the tool, performing activities within the repositories as if it was using the tool locally.

Demonstration of how to execute the following command inside your workflow:

```bash
aws s3 ls
```

### Without credentials

```bash
- name: AWS CLI v2.2
  uses: GuillaumeFalourd/aws-cli-action@main
  with:
    args: s3 ls
```

### With credentials

It's also possible to pass the AWS credentials from GitHub secrets using the implementation below:

```bash
- name: AWS CLI v2.2
  uses: GuillaumeFalourd/aws-cli-action@main
  with:
    args: s3 ls
  env:
      AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
      AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
      AWS_DEFAULT_REGION: "eu-west-1"
```
