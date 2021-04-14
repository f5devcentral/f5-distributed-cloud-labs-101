Creating GCP VPC Site
=====================

In this exercise we will deploy an GCP site from the Volterra console.

Exercise 1: Add GCP site
~~~~~~~~~~~~~~~~~~~~~~~~~~

In VoltConsole go to the "System" namespace and navigate to "Manage" -> "Site Management" -> "GCP VPC Sites".

You will need to provide the following information:

- Name: [unique name]-gcp
- GCP Region: [preferred GCP region]
- Select Ingress Gateway ...: Ingress/Egress Gateway (Two Interface)

After you select "Ingress/Egresss Gateway (Two Interface) click on "Configure"

- GCP zone names (top middle): [Preferred GCP zone]
- Number of nodes: 1
- Select existing VPC network or create new VPC network: Existing VPC Network
- GCP VPC Network Name (Inside Interface): [unique name]-internal
- Select existing subnet or create new subnet: Existing Subnet
- VPC Subnet Name: [unique name]-internal
- GCP VPC Network Name (Outside Interface): [unique name]-external
- Select existing subnet or create new subnet: Existing Subnet
- VPC Subnet Name: [unique name]-external


Next you will configure routes to enable access to the "workload" VM in your GCP site.

Under "Advanced Options" click on "Show Advanced Fields".

- Select Global Networks to Connect: Connect Global Networks

Click on "Configure" (appears after changing to "Connect Global Networks")

- Select Network Connection Type: Site Local Inside to a Global Network (default)
- Global Virtual Network: [unique name]-global

Click on "Apply"

Next you will configure static routes.

- Manage Static Routes for Inside Network: Manage Static Routes

You should now see new options.  

- Static Route Config Mode: Simple Static Route
- Simple Static Route: 10.3.2.0/24

Under "Select Automatic or Assisted 

- Automatic Deployment: system/[unique name]-gcp (cloud credential created earlier)

Click on "Save an Exit"

You can then click on "Apply" for your newly created site.

Exercise 2: Configure Route table
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In this next exercise we will update an GCP Route Table to direct traffic from
the workload subnet to the Volterra Gateway.

From the Google Cloud Console go to VPC Networks -> Routes.

Click on "Create Routes".

- Name: volterra_gateway
- Network: [unique name]-internal
- Destination IP Range: 0.0.0.0/0
- Next hop: Specify IP address
- Next hop IP address address: 10.3.1.2

Click on "Create"

Exercise 3: Test your connections
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

From UDF on the "Global Network Client" you should now be able to connect to ``http://10.2.2.4:8080/txt``

.. code-block::
   
   ubuntu@ubuntu:~$ curl 10.3.2.2:8080/txt
   ================================================
    ___ ___   ___                    _
   | __| __| |   \ ___ _ __  ___    /_\  _ __ _ __
   | _||__ \ | |) / -_) '  \/ _ \  / _ \| '_ \ '_ \
   |_| |___/ |___/\___|_|_|_\___/ /_/ \_\ .__/ .__/
                                         |_|  |_|
   ================================================

         Node Name: GCP Environment
        Short Name: workload

         Server IP: 10.3.2.2
       Server Port: 8080

         Client IP: 10.1.20.5
       Client Port: 36242

   Client Protocol: HTTP
    Request Method: GET
       Request URI: /txt

       host_header: 10.3.2.2
        user-agent: curl/7.58.0
      
You should also be able to run ``ssh 10.3.2.2`` from the "Global Network Client" host 
in UDF (the ssh key is installed on the Client already).

Once on that host you should be able to connect to ``http://10.1.20.5/txt`` (the Global Network Client in UDF)

.. code-block::
   
   ================================================
    ___ ___   ___                    _
   | __| __| |   \ ___ _ __  ___    /_\  _ __ _ __
   | _||__ \ | |) / -_) '  \/ _ \  / _ \| '_ \ '_ \
   |_| |___/ |___/\___|_|_|_\___/ /_/ \_\ .__/ .__/
                                         |_|  |_|
   ================================================

         Node Name: UDF Environment (demo app)
        Short Name: ubuntu

         Server IP: 10.1.20.5
       Server Port: 80

         Client IP: 10.3.2.2
       Client Port: 32860

   Client Protocol: HTTP
    Request Method: GET
       Request URI: /txt

       host_header: 10.1.20.5
        user-agent: curl/7.58.0
