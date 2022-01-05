#!/bin/sh

# /api/terraform/namespaces/system/terraform/aws_vpc_site/student01-awsnet/run
# terraform_run_url = "/api/terraform/namespaces/system/terraform/aws_vpc_site/%s/run" %(options.namespace + "-awsnet")
# payload = """{
#   "action": "DESTROY",
#   "namespace": "system",
#   "view_kind": "aws_vpc_site",
#   "view_name": "%s"
# }""" %(options.namespace+"-awsnet")

# https://www.volterra.io/#operation/ves.io.schema.views.aws_vpc_site.API.Get/api/config/namespaces/{namespace}/aws_vpc_sites/{name}
#curl https://f5-sales-public.console.ves.volterra.io/api/config/namespaces/system/aws_vpc_sites/student-awsnet -H "Content-type: application/json" -H "Authorization: APIToken $VOLTERRA_TOKEN"  | jq .spec.site_state
curl https://f5-sales-public.console.ves.volterra.io/api/config/namespaces/system/aws_vpc_sites/student-awsnet -H "Content-type: application/json" -H "Authorization: APIToken $VOLTERRA_TOKEN"  
