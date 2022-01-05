#!/bin/sh

# /api/terraform/namespaces/system/terraform/aws_vpc_site/student01-awsnet/run
# terraform_run_url = "/api/terraform/namespaces/system/terraform/aws_vpc_site/%s/run" %(options.namespace + "-awsnet")
# payload = """{
#   "action": "DESTROY",
#   "namespace": "system",
#   "view_kind": "aws_vpc_site",
#   "view_name": "%s"
# }""" %(options.namespace+"-awsnet")
curl https://f5-sales-public.console.ves.volterra.io/api/terraform/namespaces/system/terraform/aws_vpc_site/student-awsnet/run -H "Content-type: application/json" -H "Authorization: APIToken $VOLTERRA_TOKEN" -d '{"action": "APPLY","namespace":"system","view_kind":"aws_vpc_site", "view_name": "student-awsnet"}'
