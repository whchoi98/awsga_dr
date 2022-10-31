#!/bin/bash
# command ./vpc_create.sh
# ICNVPC , SINVPC, Client VPC 생성

aws cloudformation deploy \
  --region ap-northeast-2 \
  --stack-name "ICNVPC" \
  --template-file "./ICNVPC.yaml" \
  --parameter-overrides "KeyPair=$mykey" \
  --capabilities CAPABILITY_NAMED_IAM \
  --s3-bucket ${bucket_name} &
aws cloudformation deploy \
  --region ap-southeast-1 \
  --stack-name "SINVPC" \
  --template-file "./SINVPC.yaml" \
  --parameter-overrides "KeyPair=$mykey" \
  --capabilities CAPABILITY_NAMED_IAM &
aws cloudformation deploy \
  --region ap-northeast-2 \
  --stack-name "Client" \
  --template-file "./Client.yaml" \
  --parameter-overrides "KeyPair=$mykey" \
  --capabilities CAPABILITY_NAMED_IAM
  
