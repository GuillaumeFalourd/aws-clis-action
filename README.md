# AWS CLI action

Github Action to use any version of AWS CLI to run any AWS CLI commands on your workflows.

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
    AWS_CLI_VERSION = "2.2.0" # If not informed, the latest AWS CLI version will be used.
  with:
    args: s3 ls
```

### With credentials

It's also possible to pass the AWS credentials from GitHub secrets using the implementation below:

```bash
- name: Run AWS CLI v1.19.59 commands
  uses: GuillaumeFalourd/aws-cli-action@main
  env:
      AWS_CLI_VERSION: "1.19.59" # If not informed, the latest AWS CLI version will be used.
      AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
      AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
      AWS_DEFAULT_REGION: "eu-west-1"
  with:
    args: s3 ls
```
