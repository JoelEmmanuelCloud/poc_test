#!/bin/bash

zip -r lambda_upload.zip lambda_functions/upload/*
zip -r lambda_textract.zip lambda_functions/textract/*
zip -r lambda_bedrock.zip lambda_functions/bedrock/*
