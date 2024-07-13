import boto3
import os

def handler(event, context):
    s3 = boto3.client('s3')
    bucket_name = os.environ['BUCKET_NAME']
    file_path = event['file_path']
    key = os.path.basename(file_path)

    s3.upload_file(file_path, bucket_name, key)
    return {
        'statusCode': 200,
        'body': f'File {file_path} uploaded to bucket {bucket_name} as {key}'
    }
