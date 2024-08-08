#!/bin/bash

if [[ "$#" -ne 5 ]]; then
    echo "Usage: $0 <bucket_name> <bucket_region> <default_page> <error_page> <aws_profile>"
    exit 1
fi

bucket_name=$1
bucket_region=$2
default_page=$3
error_page=$4
aws_profile=$5

# Create bucket conditionally based on the region
aws s3api create-bucket --bucket $bucket_name --profile $aws_profile $( [ "$bucket_region" != "us-east-1" ] && echo "--create-bucket-configuration LocationConstraint=$bucket_region" )

# Allow public access
aws s3api put-public-access-block --bucket $bucket_name --public-access-block-configuration "BlockPublicPolicy=false" --profile $aws_profile
aws s3 website s3://$bucket_name --index-document $default_page --error-document $error_page --profile $aws_profile
aws s3api put-bucket-policy --bucket $bucket_name --policy '{
    "Version": "2012-10-17",
    "Statement": [
        { 
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::'"$bucket_name"'/*"
        }
    ]
}' --profile $aws_profile

# Copy website files to the bucket
aws s3 cp website s3://$bucket_name/ --recursive --profile $aws_profile
    
echo "
------------------------------
Bucket URL: http://$bucket_name.s3-website-$bucket_region.amazonaws.com
------------------------------
"
