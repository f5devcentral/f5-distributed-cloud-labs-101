#!/bin/sh
curl https://f5-sales-public.console.ves.volterra.io/api/config/namespaces/system/aws_vpc_sites -H "Content-type: application/json" -H "Authorization: APIToken $VOLTERRA_TOKEN" -d @./aws-site-student-awsnet-output.json
