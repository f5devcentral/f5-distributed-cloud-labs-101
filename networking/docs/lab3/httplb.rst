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

.. note::
  If you are not setup with a delegated domain you can disable the option to automatically manage DNS records.
  You can supply an arbitrary domain (example.com) and later you can use the following
  command to verify

  .. code-block::
    
    $ curl --resolve [unique-name].example.com:80:[IP address of ves.io name created by LB] http://[unique-name].example.com

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

You should now be able to go to the DNS name that you entered 
previously in a web browser.

.. code-block::
    
    ================================================
    ___ ___   ___                    _
    | __| __| |   \ ___ _ __  ___    /_\  _ __ _ __
    | _||__ \ | |) / -_) '  \/ _ \  / _ \| '_ \ '_ \ 
    |_| |___/ |___/\___|_|_|_\___/ /_/ \_\ .__/ .__/
                                        |_|  |_|
    ================================================

        Node Name: AWS Environment
        Short Name: ip-10-0-3-14

        Server IP: 10.0.3.14
        Server Port: 8080

        Client IP: 10.0.3.29
        Client Port: 51201

    Client Protocol: HTTP
    Request Method: GET
        Request URI: /

        host_header: frontend.[unique name].[tenant domain]
        user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.192 Safari/537.36
    x-forwarded-for: 192.0.2.10

If you append "/backend/" to the URL you should see the following output 
that shows how the "frontend" application is able to connect to the "backend"
via the TCP Load Balancer.

.. code-block::
    
    ================================================
    ___ ___   ___                    _
    | __| __| |   \ ___ _ __  ___    /_\  _ __ _ __
    | _||__ \ | |) / -_) '  \/ _ \  / _ \| '_ \ '_ \ 
    |_| |___/ |___/\___|_|_|_\___/ /_/ \_\ .__/ .__/
                                        |_|  |_|
    ================================================

        Node Name: UDF Environment (Backend App)
        Short Name: ubuntu

        Server IP: 10.1.1.4
        Server Port: 8443

        Client IP: 10.1.1.6
        Client Port: 52595

    Client Protocol: HTTPS
    Request Method: GET
        Request URI: /txt

        host_header: backend.example.local
        user-agent: Frontend App/1.0
    x-forwarded-for: 10.0.3.29