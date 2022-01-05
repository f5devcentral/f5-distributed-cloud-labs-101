Creating Azure VNET
===================

In this exercise we will create an Azure VNET using the Azure Portal
BASH Cloud Console and terraform.  Please see the following for more
information about using Terraform from Bash in Azure Cloud Shell: https://docs.microsoft.com/en-us/azure/cloud-shell/example-terraform-bash

Exercise 1: Launch Bash Cloud Shell
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Following the directions from the link above, launch Azure Bash Cloud Shell.

.. code-block:: shell
    
    Requesting a Cloud Shell.Succeeded.
    Connecting terminal...

    Welcome to Azure Cloud Shell

    Type "az" to use Azure CLI
    Type "help" to learn about Cloud Shell

    eric_chen@Azure:~$

If you have access to multiple subscriptions make sure that you set the one
that you would like to use in this lab.

.. code-block:: shell
    
    $ az account set --subscription mysubscription

You will next need to download a copy of the lab files.  

Run the command ``git clone https://github.com/f5devcentral/f5-volterra-labs-101``

.. code-block:: shell
    
    eric_chen@Azure:~$ git clone https://github.com/f5devcentral/f5-volterra-labs-101
    Cloning into 'f5-volterra-labs-101'...
    remote: Enumerating objects: 263, done.
    remote: Counting objects: 100% (263/263), done.
    remote: Compressing objects: 100% (188/188), done.
    remote: Total 1861 (delta 126), reused 181 (delta 74), pack-reused 1598
    Receiving objects: 100% (1861/1861), 11.65 MiB | 43.37 MiB/s, done.
    Resolving deltas: 100% (959/959), done.

Next change in to the "f5-volterra-labs-101/networking/azure" directory.

You can then run ``terraform init`` to load the necessary terraform modules.

You will need to configure the terraform.

Use the built-in editor by running the command ``code terraform.tfvars``

add the following information (replace with relevant information).

.. code-block:: 
    
    resource_group = "[unique name]-azure"
    location       = "[preferred azure region]"

save the file "ctrl +s" followed by "ctrl + q" or use menu in top right "..."

You should now be able to run ``terraform apply -auto-approve`` to build out 
your vnet.

Exercise 2: Create a Service Principal
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

When you are deploying Azure resources from VoltConsole you will need to create 
a Cloud Credential that has access to your Azure Subscription.  If you already
have a service principal you can use it.  Otherwise you can follow these steps 
to create one.  Note that you must have an "Owner" role for your subscription 
to create a service principal.

From the Azure Console Bash Cloud Shell run the following command.

.. code-block:: shell
  
  $ az ad sp create-for-rbac -n "http://[unique name]-volterra-cc" --role contributor
  {
    "appId": "xxx-xxxx",
    "displayName": "[unique-name]-volterra-cc",
    "name": "http://[unique-name]-volterra-cc",
    "password": "[password]",
    "tenant": "yyy-yyy"
  }

Copy the JSON output (starting with "{" ending with "}") of this command and keep it safe.
This credential enables read/write access to your Azure Subscription.

You will also need to retrieve your subscription ID.  You can use the following command
to list out the name, id, and whether it is your default subscription.

.. code-block:: shell
  
  $ az account show  --query [name,id,isDefault]
  [
    "f5-AZR_xxxx", <-- name
    "xxx-xxx-xxx", <-- subscription id
    true           <-- is this the default subscription 
  ]

Exercise 3: Create Volterra Azure Cloud Credential
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In VoltConsole go to the "System" namespace and navigate to "Manage" -> "Site Management" -> "Cloud Credentials".

Click on "Add Cloud Credential"

For the name enter "[unique name]-azure".

For the Cloud Credential Type: "Azure Client Secret for Service Principal" and enter the 
values based on the JSON output from before.

- Client ID: "appId" from JSON output
- Subscription ID: output of id from "account show" command 
- Tenant ID: "tenant" from JSON output 

Under Azure Client Secret click on "Configure"

enter the value of "password" from the previous JSON output and then click on "Blindfold"