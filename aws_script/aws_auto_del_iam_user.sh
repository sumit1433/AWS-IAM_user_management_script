#!/bin/bash
echo "****This script delete iam users****"
for i in `cat new_user_list`
do

aws iam delete-login-profile --user-name $i 
aws iam detach-user-policy --user-name $i --policy-arn arn:aws:iam::aws:policy/IAMUserChangePassword
aws iam detach-user-policy --user-name $i --policy-arn arn:aws:iam::aws:policy/AmazonEC2FullAccess
aws iam delete-user-permissions-boundary --user-name $i

aws iam remove-user-from-group --group-name DevOps --user-name $i
aws iam delete-user --user-name $i
done
aws iam delete-group --group-name DevOps

#iam_users inside iam_group "DevOps" both are delete 

exit
