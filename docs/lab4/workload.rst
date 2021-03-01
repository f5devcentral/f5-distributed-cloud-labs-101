Deploy Workload (frontend)
==========================

In the previous step you created a TCP Load Balancer object that made the backend 
service available via the Volterra Gateway.  You will next deploy a "frontend"
application that will use the TCP Load Balancer to access the backend service.

AWS Console
~~~~~~~~~~~

Before we can deploy the frontend application we will need to identify the IP address
of the Volterra Gateway.  This IP address will be used for internal DNS resolution as
well as the IP address of the VIP that was configured on the TCP Load Balancer previously.

From the UDF console you will need to find the "Cloud Accounts" tab that contains the URL
for your AWS console as well as the username/password that you will be using.

.. image:: aws-console-password.png

Click on the Console URL (recommend using a private browsing window to avoid any existing AWS 
console sessions you may have) and enter the provided username/password.

Click on "EC2" under "Services".

.. image:: aws-console-ec2.png

Click on "Instances" and you should see two instances running.  Select the instance that is 
of type "t3.xlarge".  This is the primary node of your Volterra Gateway (in an HW deployment 
there would be multiple instances).

Take note of the private ip of the internal interface.  It should be on the 10.0.3.0/24 network.
You will use the IP address next to configure your workload instance.

.. image:: aws-console-private-ip.png


Deploy Workload
~~~~~~~~~~~~~~~

On the Ubuntu Client (via webshell or SSH) access the following directory.

.. code-block:: shell
  
  $ cd ~/f5-volterra-labs-101/workload

This directory contains Terraform code that will deploy the frontend resource.  In 
the previous run of Terraform it also updated this directory to specify the VPC/Subnet
to deploy the workload resource.  You will need to provide the Private IP address of
the Volterra Gateway on the subnet that you deploy your workload.  The Private IP is the 
one that you previously captured while looking at the AWS Console.

run "terraform apply" and enter the private IP when prompted for the Volterra Gateway.

.. code-block:: shell
  
  ubuntu@ubuntu:~/f5-volterra-labs-101/workload$ terraform apply
  var.volterra_gateway
    Enter a value: 10.0.3.XX

Enter "yes" when prompted.

You will then see an output that includes the IP address of the workload instance.
Record this IP address, you will need it in the next step when you configure the HTTP 
Load Balancer.

.. code-block:: shell
  
  Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
  
  Outputs:
  
  workload_ip = "10.0.3.14"