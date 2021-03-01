HTTP Load Balancer
==================

In the previous steps you created the necessary connection for the frontend
application to securely communicate with the backend application.  The next
steps will expose the frontend service to the public through a Volterra 
Regional Edge.

Regional Edge
~~~~~~~~~~~~~

A Regional Edge (RE) is part of Voltera Global Network that provides connectivity 
to services.  Previously when we deployed the UDF / AWS sites these were considered
"Customer Edge (CE)" and they make use of RE to communicate (each CE is associated with 
two RE).

HTTP Load Balancer
~~~~~~~~~~~~~~~~~~

Start in VoltConsole.

Navigate the menu to go to "Manage"->"HTTP Load Balancers" and click on "Add HTTP Load Balancers".

.. note:: This may appear differently if there is an existing LB resource

At this point you will have to go through the steps of setting up a HTTP LB of creating an origin pool,
health monitor, and TCP LB object.

- Name: [unique name]-frontend-http
- Domains: frontend.[unique name].[supplied domain name for your tenant]
- Select type of Load Balancer: HTTP
- Automatically Manage DNS Records: Yes/Check

Under "Origin Pools" click on "Configure" and then "Add item".

- Origin Pool Method: Origin Pool

Under "Origin Pool" then click on "Create new pool" under the pull down menu.

Use the private IP address for the workload instance that you created in the previous exercise.

- Name: frontend-http
- Select Type of Origin Server: IP address of Origin Server on given Sites
- Enter ip: 10.0.3.XX
- Site: [unique name]-aws
- Select Network on this site: Inside Network

Under "List of Health Checks" select the option to create a new Health Check

- Name: frontend-http-health-check

You wil then need to click on configure under "HTTP Health Check" followed by "Apply".

Then click on "Continue" to finish creating the Health Check.

After creating the new pool you select the newly created pool.

Under "Where to advertise the VIP" change to "Advertise Custom" then click on "Configure" next to "Advertise Custom".

Under "Custom Advertise VIP Configuration" leave "Select where to advertise" on "Site".

- Site Network: Inside
- Site Reference: [unique name]-aws

Click on "Apply".

On the main screen you can then click on "Save and Exit".