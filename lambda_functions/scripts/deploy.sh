#!/bin/bash

lambda_functions/scripts/create_zip.sh
terraform init
terraform apply -auto-approve
