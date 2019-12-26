#!/usr/bin/env bash

# Copy credentials to EC2 instanace
ec2_ip=$1  # first arg is IP address of instance
aws_dir=~/.aws/
git_credentials=~/.ssh/
aws_ssh_key=$aws_dir.aws_ssh/ndmiles_admin_useast1.pem

# Copy files credentials to AWS
scp -ri "$aws_ssh_key" $aws_dir ec2-user@$ec2_ip:~
scp -ri "$aws_ssh_key" $git_credentials ec2-user@$ec2_ip:~

scp -ri "$aws_ssh_key" ~/astropy-sep-lambda/AWS_setup ec2-user@$ec2_ip:~

# log in to the instance
ssh -i "$aws_ssh_key" ec2-user@$ec2_ip