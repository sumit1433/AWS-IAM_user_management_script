#!/bin/bash

echo "**this script helps to add iam users automatically**"

aws iam create-group --group-name DevOps 

for i in $(cat new_user_list)
do

aws iam create-user --user-name $i
aws iam create-login-profile --user-name $i --password "redhat@123" --password-reset-required
aws iam attach-user-policy --user-name $i --policy-arn arn:aws:iam::aws:policy/AmazonEC2FullAccess
aws iam attach-user-policy --user-name $i --policy-arn arn:aws:iam::aws:policy/IAMUserChangePassword
aws iam put-user-permissions-boundary --user-name $i --permissions-boundary arn:aws:iam::966127384272:policy/ec2readonlyaccess_and_chang_password
aws iam add-user-to-group --group-name DevOps --user-name $i

done
exit
