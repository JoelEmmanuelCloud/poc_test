import boto3
import os

def handler(event, context):
    s3 = boto3.client('s3')
    textract = boto3.client('textract')

    bucket_name = os.environ['BUCKET_NAME']
    key = event['key']

    response = textract.detect_document_text(
        Document={'S3Object': {'Bucket': bucket_name, 'Name': key}}
    )

    text = ''
    for item in response["Blocks"]:
        if item["BlockType"] == "LINE":
            text += item["Text"] + '\n'

    return {
        'statusCode': 200,
        'body': text
    }
