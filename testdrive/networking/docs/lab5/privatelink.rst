AWS PrivateLink
===============

In AWS it is possible to publish resources that are only accessible within a VPC.

This allows you to take a service like S3 (storage), RDS (database), etc... and 
restrict that service to your account.  You can also use this as a method to publish
services (whether AWS your own) to other AWS accounts.

In this lab exercise we will use VoltMesh to extend an AWS PrivateLink service 
outside of AWS.  This allows you to securely access the AWS service without the 
need to expose it to the Public internet.

Exploring AWS PrivateLink
~~~~~~~~~~~~~~~~~~~~~~~~~

Go back to the original terraform directory where you created your AWS VPC 
and run terraform output to see the output.

.. code-block:: shell
    
    $ cd ~/f5-volterra-labs-101/networking/terraform/
    $ terraform output 

You should see output about S3.  Take note of the output (yours will differ).

.. code-block::
    
    ...
    AWS_BUCKET_URL = "udf-s3bucket20210706133543402400000001.s3.amazonaws.com"
    ...
    AWS_ENDPOINT_URL = "*.vpce-0c4382a137a24f1ad-ecnc0dc6.s3.us-east-1.vpce.amazonaws.com"
    ...

From a device that is NOT in UDF try connecting to the following URL/File (adjust to match your output of AWS_BUCKET_URL)

``https://udf-s3bucket20210706133543402400000001.s3.amazonaws.com/top-secret-file.txt``

You should see output similar to the following.

.. code-block::
    
    $ curl https://udf-s3bucket20210706133543402400000001.s3.amazonaws.com/top-secret-file.txt
    <?xml version="1.0" encoding="UTF-8"?>
    <Error><Code>AccessDenied</Code><Message>Access Denied</Message><RequestId>3K40F68MDY405JG4</RequestId><HostId>MP15oHF2tZLXxRaQKNgUwdDx9xZN0LXALJ8tfoNDAGq0QH04d11HZKIom11WoxFQIPlr4pTkOlE=</HostId></Error>

This error is occurring because access to the S3 bucket has been limited to only allow access from the AWS VPC (technically you can also access it from the UDF Public IP to allow terraform to destroy the resource).

SSH to the jumphost (from the UDF environment) that you deployed in AWS.  It should be in the output from earlier as.

.. code-block::
    
    ...
    AWS_INSTANCE = "192.0.2.10"
    ...
    $ ssh ubuntu@192.0.2.10

From the previous output find the AWS_ENDPOINT_URL and prefix on "bucket." and perform 
the dig command to look at the DNS entry in AWS.

.. code-block::
    
    ubuntu@ip-10-0-0-XX:~$ dig bucket.vpce-0c4382a137a24f1ad-ecnc0dc6.s3.us-east-1.vpce.amazonaws.com +short
    10.0.3.XX

You can also get to this from an outside resolver (not always the case).

.. code-block::
    
    $ dig @8.8.8.8 bucket.vpce-0c4382a137a24f1ad-ecnc0dc6.s3.us-east-1.vpce.amazonaws.com +short
    10.0.3.XX

You should now be able to access the file when using the ENDPOINT_URL (remove the "*").  The format will be

``https://bucket.[ENDPOINT_URL]/[BUCKET_NAME]/top-secret-file.txt``

.. code-block::
       
    ubuntu@ip-10-0-0-XX:~$ curl https://bucket.vpce-0c4382a137a24f1ad-ecnc0dc6.s3.us-east-1.vpce.amazonaws.com/udf-s3bucket20210706133543402400000001/top-secret-file.txt
    [redacted value]

You can now exit your SSH session to the AWS jumphost for the next section of the lab.

Accessing AWS PrivateLink via Routing
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Since you previously setup routing you should also be able to access this resource from the UDF Global Network Client.  If you did not setup routing you can skip to the next section.

.. code-block::
    
        ubuntu@udf-global-network-client:~$ curl  --resolve bucket.vpce-0c4382a137a24f1ad-ecnc0dc6.s3.us-east-1.vpce.amazonaws.com:443:10.0.3.XX   \
        https://bucket.vpce-0c4382a137a24f1ad-ecnc0dc6.s3.us-east-1.vpce.amazonaws.com/udf-s3bucket20210706133543402400000001/top-secret-file.txt
    [redacted value]

You were able to successfully connect using the PrivateLink IP address.  In the next example we will use a TCP LB.

There are some legacy VPC Endpoint Gateways where you will want to use routing as a method to connect.

Otherwise it is easier to use a proxy method.

Accessing AWS PrivateLink via Proxy
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In this next lab we want to expose the AWS PrivateLink service without the need to create a Global
Network connection between the sites.

Create a TCP Load Balancer.

- Name: privatelink
- Domain: bucket.[AWS_ENDPOINT_URL]
- Listen Port: 443
- With SNI: Checked
- Where to Advertise: Advertise Custom

Click on "Configure" under "Origin Pools"

Click on "Add Item" next to "Origin Pools" 

- Select Origin Pool Method: Origin Pool (default)
- Origin Pool: Click on "Create new origin pool"

- Name: privatelink
- Select Type of Origin Server: DNS Name of Origin Server on given sites
- DNS Name:  bucket.[AWS_ENDPOINT_URL] (note we are using DNS to discover the IP)
- Site or Virtual Site: Site
- Site: [unique name]-awsnet
- Select Network on the site: Inside Network
- Port: 443 
- List of Health Check: tcp (create a new one if one does not exist)

Click on "Continue" (should return to previous screen)

Click on "Apply"

Click on "Configure" under "Advertise Custom"

- Select where to Advertise: Site (default)
- Site Network: Inside Network
- Site Reference: [unique name]-udf
  
Click on "Apply"

Click on "Save and Exit"

Verify that DNS has been created for your UDF endpoint.

.. code-block::
    
    ubuntu@udf-global-network-client:~$ dig @10.1.20.6 bucket.vpce-0c4382a137a24f1ad-ecnc0dc6.s3.us-east-1.vpce.amazonaws.com +short
    10.1.20.6

You should now be able to access the endpoint using your TCP LB.

.. code-block::
    
    ubuntu@udf-global-network-client:~$ curl --resolve bucket.vpce-0c4382a137a24f1ad-ecnc0dc6.s3.us-east-1.vpce.amazonaws.com:443:10.1.20.6 \
    https://bucket.vpce-0c4382a137a24f1ad-ecnc0dc6.s3.us-east-1.vpce.amazonaws.com/udf-s3bucket20210706133543402400000001/top-secret-file.txt
    [redacted value]

This will also work without "--resolve".  The "udf-global-network-client" is configured to use the Volterra 
gateway for its default DNS.

Take a look at the Volterra console for stats collected related to the TCP LB.

You can extend this example to also advertise the TCP LB in other sites.  This can
enable you to access AWS PrivateLink from Azure, GCP, etc...

In this lab we opted to use a TCP LB to preserve the existing TLS connection.  