#!/bin/bash

set -e

export AWS_DEFAULT_REGION=eu-west-1

STACKNAME=image-database

if ! aws cloudformation describe-stacks --stack-name ${STACKNAME} > /dev/null; then
    aws cloudformation create-stack --capabilities CAPABILITY_IAM --stack-name ${STACKNAME} --template-body file://cfn.yml
else
    aws cloudformation update-stack --capabilities CAPABILITY_IAM --stack-name ${STACKNAME} --template-body file://cfn.yml || echo "No Update"
fi

cfn-tail ${STACKNAME}