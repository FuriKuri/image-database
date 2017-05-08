#!/bin/bash

set -e

export AWS_DEFAULT_REGION=eu-west-1

STACKNAME=image-database

if ! aws cloudformation describe-stacks --stack-name ${STACKNAME} &> /dev/null; then
    aws cloudformation create-stack --capabilities CAPABILITY_IAM --stack-name ${STACKNAME} --template-body file://cfn.yml
else
    aws cloudformation update-stack --capabilities CAPABILITY_IAM --stack-name ${STACKNAME} --template-body file://cfn.yml || echo "No Update"
fi

echo "Wait for stack complete ..."

aws cloudformation wait stack-create-complete --stack-name ${STACKNAME}

PAGE_URL=$(aws cloudformation describe-stacks --stack-name ${STACKNAME} | jq '.Stacks[0].Outputs[] | select(.OutputKey=="PageUrl") | .OutputValue')

echo "Search images over: $PAGE_URL"