#!/bin/sh

ZIPFILE=lambda_handler.zip
FNAME=lambda_handler_go
GOOS=linux go build lambda_handler.go
zip $ZIPFILE lambda_handler

if ! aws lambda get-function --function-name $FNAME 1> /dev/null 2>&1;  then
    aws lambda create-function      --function-name $FNAME --zip-file fileb://./$ZIPFILE --runtime go1.x --role arn:aws:iam::854014537498:role/lambda_basic_execution --handler lambda_handler
else
    aws lambda update-function-code --function-name $FNAME --zip-file fileb://./$ZIPFILE
fi