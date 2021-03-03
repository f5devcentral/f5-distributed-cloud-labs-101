TCP Load Balancer
=================

On of the requirements from the "Narrative" is to enable the frontend application
in AWS to communicate with the backend application that is on-prem.

The frontend application makes use of DNS to determine the IP address of the backend
application.  In the on-prem environment the name "backend.example.local" resolves to
the backend IP of 10.1.1.4.

In the AWS environment we want to resolve the name "backend.example.local" to resolve to
the IP address of the Volterra Gateway (VG).  The VG will host a Virtual IP (VIP) that will
host a TCP Load Balancer that will proxy traffic back to the original backend application.

Application Name Space
~~~~~~~~~~~~~~~~~~~~~~

Up to this point we have been using the "System" namespace to access resources.  We will now 
change to the "Application Namespace".  Start by clicking on the upper right "App" icon.
Click on the first namespace and use the search to find your own namespace.

.. image:: app-namespace-select.png

Navigate the menu to go to "Manage"->"TCP Load Balancers" and click on "Add TCP Load Balancers".

.. note:: This may appear differently if there is an existing LB resource

.. image:: add-tcp-lb.png

At this point you will have to go through the steps of setting up a TCP LB of creating an origin pool,
health monitor, and TCP LB object.

- Name: [unique name]-backend-tcp
- Domains: backend.example.local
- Listen Port: 8443

Under "Origin Pools" click on "Configure" and then "Add item".

- Origin Pool Method: Origin Pool

Under "Origin Pool" then click on "Create new pool" under the pull down menu.

- Name: backend-tcp
- Select Type of Origin Server: IP address of Origin Server on given Sites
- Enter ip: 10.1.1.4
- Site: [unique name]-udf
- Port: 8443
- Select Network on this site: Outside Network

Under "List of Health Checks" select the option to create a new Health Check

- Name: backend-tcp-health-check
- Health Check: TCP Healthcheck

You wil then need to click on configure under "TCP Health Check" followed by "Apply".

Then click on "Continue" to finish creating the Health Check.

After creating the new pool you select the newly created pool.

Under "Where to advertise the VIP" change to "Advertise Custom" then click on "Configure" next to "Advertise Custom".

Under "Custom Advertise VIP Configuration" leave "Select where to advertise" on "Site".

- Site Network: Inside
- Site Reference: [unique name]-aws

Click on "Apply".

On the main screen you can then click on "Save and Exit".