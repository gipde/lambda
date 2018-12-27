#!/bin/sh
ZIPFILE=lambda_handler.zip
FNAME=lambda_handler_js
zip $ZIPFILE index.js

# Handler = Filename.js + FN-Name
# handler lambdfa_handler.call

if ! aws lambda get-function --function-name $FNAME 1> /dev/null 2>&1;  then
    echo "Create Function $FNMAE..."
    aws lambda create-function      --function-name $FNAME --zip-file fileb://./$ZIPFILE --runtime nodejs8.10 --role arn:aws:iam::854014537498:role/lambda_basic_execution --handler index.call
else
    echo "Update Function $FNMAE..."
    aws lambda update-function-code --function-name $FNAME --zip-file fileb://./$ZIPFILE
fi

