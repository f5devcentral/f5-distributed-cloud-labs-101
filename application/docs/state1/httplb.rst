HTTP Load Balancer
==================

Now that you have connected the UDF Site to the Volterra Global Network you
will expose the applications in the UDF site using a Regional Edge and HTTP
Load Balancer.

Regional Edge
~~~~~~~~~~~~~

A Regional Edge (RE) is part of Voltera Global Network that provides connectivity 
to services.  

HTTP Load Balancer
~~~~~~~~~~~~~~~~~~

Start in VoltConsole.

Navigate the menu to go to "Manage"->"HTTP Load Balancers" and click on "Add HTTP Load Balancers".

.. note:: This may appear differently if there is an existing LB resource

** Brews Single Page Application **

At this point you will have to go through the steps of setting up a HTTP LB of creating an origin pool,
health monitor, and HTTP LB object.

- Name: brews
- Domains: [unique name]-brews.[supplied domain name for your tenant]
- Select type of Load Balancer: HTTP
- Automatically Manage DNS Records: Yes/Check

.. note::
  If you are not setup with a delegated domain you can disable the option to automatically manage DNS records.
  You can supply an arbitrary domain (example.com) and later you can use the following
  command to verify

  .. code-block::
    
    $ curl --resolve [unique-name]-brews.example.com:80:[IP address of ves.io name created by LB] http://[unique-name]-brews.example.com

Under "Origin Pools" click on "Configure" and then "Add item".

- Origin Pool Method: Origin Pool

Under "Origin Pool" then click on "Create new pool" under the pull down menu.

Use the private IP address for the workload instance that you created in the previous exercise.

- Name: spa-http
- Select Type of Origin Server: IP address of Origin Server on given Sites
- Enter ip: 10.1.1.4
- Site: [unique name]-udf
- Select Network on this site: Outside Network
- Port: 8081

Under "List of Health Checks" select the option to create a new Health Check

- Name: spa-http-health-check

You wil then need to click on configure under "HTTP Health Check" followed by "Apply".

Then click on "Continue" to finish creating the Health Check.

After creating the new pool you select the newly created pool.

Click on "Apply".

On the main screen you can then click on "Save and Exit".

** Brews API Service **


- Name: api
- Domains: [unique name]-api.[supplied domain name for your tenant]
- Select type of Load Balancer: HTTP
- Automatically Manage DNS Records: Yes/Check

Under "Origin Pools" click on "Configure" and then "Add item".

- Origin Pool Method: Origin Pool

Under "Origin Pool" then click on "Create new pool" under the pull down menu.

Use the private IP address for the workload instance that you created in the previous exercise.

- Name: api-http
- Select Type of Origin Server: IP address of Origin Server on given Sites
- Enter ip: 10.1.1.4
- Site: [unique name]-udf
- Select Network on this site: Outside Network
- Port: 8000

Under "List of Health Checks" select the option to create a new Health Check

- Name: spa-http-health-check

You wil then need to click on configure under "HTTP Health Check" followed by "Apply".

Then click on "Continue" to finish creating the Health Check.

After creating the new pool you select the newly created pool.

Click on "Apply".

On the main screen you can then click on "Save and Exit".


You should now be able to go to the DNS name that you entered 
previously in a web browser.
