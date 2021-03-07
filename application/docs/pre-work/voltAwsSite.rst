Create AWS Volt Site
====================
In this section we will VoltConsole to create an AWS VPC and a new Volterra Site in that VPC.

Terminology
~~~~~~~~~~~

VPC
    VPC is a Virtual Private Cloud.
Volterra Site
    A Volterra Site is a physical or cloud location where Volterra Nodes are deployed. 

Exercise 1: Create Cloud Credentials
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. note:: 
  
  based on the selected region for your UDF deployment we recommend that you use the following
  AWS region and Availability Zone during this lab.

  ==================== ================
  Variable             Value
  ==================== ================
  Region               |aws_region|
  Availability Zone    |aws_zone|
  ==================== ================

  When you access the AWS Console (not required during this lab) make sure that you select 
  the same region to view any resources created by Volterra.
 

In your UDF deployment there is a *Cloud Accounts* tab that contains releative information about the ephemeral AWS account created for you. Take note of your *API Key* and *API Secret*.

|cloud_creds|

#. In VoltConsole switch to the *System* context.

    |system_context|

#. Navigate the menu to go to "Manage"->"Site Management" and click on "Cloud Credentials".

    |cloud_creds_menu|

#. Click on the *Add Cloud Credentials* button.

    |cloud_creds_add|

#. Enter the following variables, substituting your information:

    ==========  =====
    Variable    Value
    ==========  =====
    Name        your_namespace-udf
    Access Key  ID Access Key from the UDF Cloud Accounts tab
    ==========  =====

#. Under the *Secret Access Key* section, click the *Configure* link.
#. Enter the following variables:

    ========= =====
    Variable  Value
    ========= =====
    Type      Paste your API Key from the UDF Cloud Accounts tab
    ========= =====

#. Click the *Blindfold* button.
#. Click the *Apply* button.
#. Click the *Save and Exit* button.

Exercise 2: Create AWS VPC Site
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#. Navigate the menu to go to "Manage"->"Site Management" and click on "Cloud Credentials".

    |aws_vpc_site_menu|

#. Click on the *Add AWS VPC Site* button.

    |aws_vpc_site_add|

#. Enter the following variables, substituting your information:

      ================================= =====
      Variable                          Value
      ================================= =====
      Name                              your_namespace-aws
      AWS Regional                      One of the AWS regions listed in the UDF Cloud Accounts tab
      Primary IPv4 CIDR block           10.0.0.0/16
      Select Ingress Gateway            Voltstack Cluster
      Automatic deployment              The Cloud Credentials created in Exercise 1
      ================================= =====

      |aws_vpc_site|

      .. note:: 
  
      The maximum site name length is 16 characters. If your namespace is long adjust your site name accordingly.

#. Under the *Voltstack Cluster (One Interface)* section, click the *Configure* link.

#. Enter the following variables:

    =========== =====
    Variable    Value
    =========== =====
    AWS AZ Name Availability zone in the same AWS region selected in the previous step
    IPv4 Subnet 10.0.0.0/24
    =========== =====

    |aws_vpc_site_interface|

#. Click *Apply*.

#. Under the *Site Node Parameters* enter the following variables:

    .. Note:: This step is optional for the lab unless you would like to SSH into the node

    =============== =====
    Variable        Value
    =============== =====
    Pulbic SSH key  Paste your public key
    =============== =====

#. Click *Save and Exit*.

#. Refresh the page. Once present, click the *Apply* button.

    |aws_vpc_site_apply|

.. |cloud_creds| image:: ../_static/cloud_creds.png
.. |system_context| image:: ../_static/system_context.png
.. |cloud_creds_menu| image:: ../_static/cloud_creds_menu.png
.. |cloud_creds_add| image:: ../_static/cloud_creds_add.png
.. |aws_vpc_site_menu| image:: ../_static/aws_vpc_site_menu.png
.. |aws_vpc_site_add| image:: ../_static/aws_vpc_site_add.png
.. |aws_vpc_site| image:: ../_static/aws_vpc_site.png
.. |aws_vpc_site_interface| image:: ../_static/aws_vpc_site_interface.png
.. |aws_vpc_site_apply| image:: ../_static/aws_vpc_site_apply.png