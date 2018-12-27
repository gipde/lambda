#!/bin/sh
ZIPFILE=lambda_handler.zip
FNAME=lambda_handler_java
./gradlew assemble
(cd build/classes/java/main && zip -r - *) > $ZIPFILE

# Handler = Filename.js + FN-Name
# handler lambdfa_handler.call

if ! aws lambda get-function --function-name $FNAME 1> /dev/null 2>&1;  then
    echo "Create Function $FNMAE..."
    aws lambda create-function      --function-name $FNAME --zip-file fileb://./$ZIPFILE --runtime java8 --role arn:aws:iam::854014537498:role/lambda_basic_execution --handler com.schneidernet.Handler::handleRequest
else
    echo "Update Function $FNMAE..."
    aws lambda update-function-code --function-name $FNAME --zip-file fileb://./$ZIPFILE
fi

