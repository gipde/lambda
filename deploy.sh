#!/bin/sh
ZIPFILE=./build/distributions/lambda.zip
FNAME=lambda_handler_java

./gradlew build

if ! aws lambda get-function --function-name $FNAME 1> /dev/null 2>&1;  then
    echo "Create Function $FNMAE..."
    aws lambda create-function      --function-name $FNAME --zip-file fileb://$ZIPFILE --runtime java8 --role arn:aws:iam::854014537498:role/lambda_basic_execution --handler com.schneidernet.Handler::handleRequest
else
    echo "Update Function $FNMAE..."
    aws lambda update-function-code --function-name $FNAME --zip-file fileb://$ZIPFILE
fi

