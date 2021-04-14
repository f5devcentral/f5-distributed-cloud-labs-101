Creating GCP VPC
================

In this exercise we will create a GCP VPC using the GCP Cloud Shell
BASH Cloud Console and terraform.  Please see the following for more
information about using Terraform from Google Cloud Shell: https://www.hashicorp.com/blog/kickstart-terraform-on-gcp-with-google-cloud-shell

Exercise 1: Launch Google Cloud Shell
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

From your Google Console launch the Cloud Shell (top right of screen).

.. code-block:: shell
   
  Welcome to Cloud Shell! Type "help" to get started.
  Your Cloud Platform project in this session is set to [PROJECT ID].
  Use “gcloud config set project [PROJECT_ID]” to change to a different project.
  eric_chen@cloudshell:~ ([PROJECT ID])$

First you will need to follow the directions from: https://www.volterra.io/docs/reference/cloud-cred-ref/gcp-vpc-pol-reference

Note that you may need to also add the additional permissions.

.. code-block:: shell
    
  gcloud iam roles update volt_gcp_vpc_role --project=[PROJECT ID]  --add-permissions=compute.regionOperations.get
  gcloud iam roles update volt_gcp_vpc_role --project=[PROJECT ID]  --add-permissions=compute.instanceTemplates.useReadOnly
  gcloud iam roles update volt_gcp_vpc_role --project=[PROJECT ID]  --add-permissions=compute.regionBackendServices.create
  gcloud iam roles update volt_gcp_vpc_role --project=[PROJECT ID]  --add-permissions=compute.healthChecks.useReadOnly
  gcloud iam roles update volt_gcp_vpc_role --project=[PROJECT ID]  --add-permissions=compute.instanceGroups.use
  gcloud iam roles update volt_gcp_vpc_role --project=[PROJECT ID]  --add-permissions=compute.regionBackendServices.get
  gcloud iam roles update volt_gcp_vpc_role --project=[PROJECT ID]  --add-permissions=compute.regionBackendServices.delete
  gcloud iam roles update volt_gcp_vpc_role --project=[PROJECT ID]  --add-permissions=compute.regionBackendServices.use

You will next need to download a copy of the lab files.  

Run the command ``git clone https://github.com/f5devcentral/f5-volterra-labs-101``

.. code-block:: shell
    
  eric_chen@cloudshell:~ ([PROJECT ID])$ git clone https://github.com/f5devcentral/f5-volterra-labs-101
  Cloning into 'f5-volterra-labs-101'...
  remote: Enumerating objects: 494, done.
  remote: Counting objects: 100% (494/494), done.
  remote: Compressing objects: 100% (323/323), done.
  remote: Total 2092 (delta 267), reused 360 (delta 169), pack-reused 1598
  Receiving objects: 100% (2092/2092), 12.14 MiB | 28.99 MiB/s, done.
  Resolving deltas: 100% (1100/1100), done.

Next change in to the "f5-volterra-labs-101/networking/gcp" directory.

You can then run ``terraform init`` to load the necessary terraform modules.

You will need to configure the terraform.

Use the built-in editor by running the command ``vi terraform.tfvars``

add the following information (replace with relevant information).

.. code-block:: 
    
  prefix  = "[unique prefix]"
  region  = "[preferred GCP region]"
  project = "[PROJECT ID]"


You should now be able to run ``terraform apply -auto-approve`` to build out 
your VPC.

Exercise 2: Create Volterra GCP Cloud Credential
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

From Google Cloud Shell export the key for the service ID that you created previously.

.. code-block:: shell
    
    $ gcloud iam service-accounts keys create --iam-account eric-chen-volterra-sa@[PROJECT ID].iam.gserviceaccount.com key.json
    $ cat key.json

In VoltConsole go to the "System" namespace and navigate to "Manage" -> "Site Management" -> "Cloud Credentials".

Click on "Add Cloud Credential"

For the name enter "[unique name]-gcp".

For the Cloud Credential Type: "GCP Credentials" 

For the Secret value enter the contents of the "key.json" file that you created earlier
 and then click on "Blindfold"