HTTP Load Balancer
==================

In this lab exercise we will create an HTTP Load Balancer that will allow you
to access frontend application that will allow you to explore the AWS environment.

We will first access the AWS environment by connecting directly to an EC2 instance 
that is directly exposed on the Public Internet.

Afterwards we will connect via a secure tunnel through a Distributed Cloud Mesh node
to an EC2 instance that does not have a Public IP.

You will first create an origin pool for your frontend application in AWS.

Afterwards you will create a HTTP Load Balancer that will reference your origin pool 
and expose the service on Distributed Cloud's Regional Edge.

In the following lab we will add an additional "backend" resource that will allow us 
to connect to our "on-prem" site.

.. image:: httplb-lab.png

Regional Edge
~~~~~~~~~~~~~

A Regional Edge (RE) is part of Distributed Cloud Global Network that provides connectivity 
to services.  Previously when we deployed the UDF / AWS sites these were considered
"Customer Edge (CE)" and they make use of RE to communicate (each CE is associated with 
two RE).


Exercise 1:  Public Origin Pool
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
We will first create an Origin Pool that refers to the frontend application service running in our AWS site.


#. Start in Distributed Cloud Console and switch to the "Load Balancers" context. It can be access either from the Home page or an internal page.

   .. image:: ./load-balancers-menu.png
       :width: 50%

#. Navigate the menu to go to "Manage"->"Load Balancers"->"Origin Pools". Click on *Add Origin Pool*.

  .. image:: ./menu-manage-load-balancers-origin.png
      :width: 50%


#. Enter the following variables:

    Use the private IP address for the workload instance that you created in the previous exercise.

    ================================= =====
    Variable                          Value
    ================================= =====
    Name                              frontend-public
    ================================= =====

#. Click on "Add Item" under Origin Servers

#. Enter the following information 

    ================================= =====
    Variable                          Value
    ================================= =====   
    Select Type of Origin Server      Public DNS Name of Origin Server (default)
    DNS Name                          public.lab.f5demos.com
    ================================= =====

    |op-pool-basic|

#. Click on "Add Item" to return to the previous screen

#. Enter "80" for the "Port"

#. Under the *List of Health Check(s)* section, click the *Add item* button.

#. Click the *Health Check object* dropdown list. Click the *Create new healthcheck* button.

#. Enter the following variables:

    ========= =====
    Variable  Value
    ========= =====
    name      http
    ========= =====

#. Click the *configure* button under "HTTP Health Check"

#. Click *Apply* to exit the "Health Check HTTP Parameters" dialogue.
#. Click *Continue* to return to the "Origin Pool" configuration.
#. Click the *Save and Exit* button to create the Origin Pool.

Exercise 2: HTTP Load Balancer Configuration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#. Navigate the menu to go to "Manage"->"HTTP Load Balancers" and click on "Add HTTP Load Balancers".

    |http_lb_menu| |http_lb_add|

#. Enter the following variables:

    ================================= =====
    Variable                          Value
    ================================= =====
    Name                              frontend
    Domains                           studentXX.sales-public.f5demos.com
    Select type of Load Balancer      HTTP
    Automatically Manage DNS Records  Yes/Check 
    ================================= =====

    |lb-basic|

Exercise 3: Configure Default Origin Server
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
We'll next configure the "Default Origin Servers". 
    
#. Click on the *Add Item* link under the *Default Origin Servers* section.

#. The "Select Origin Pool Method" will be set to "Origin Pool". Under the "Origin Pool" dropdown menu select the "fronted-public" you created earlier.
 
#. Click the *Add Item* button to exit the "Origin Pools" dialogue.

#. Notice that in the "VIP Creation" section *Advertise On Internet* has been selected by default.

    |lb-vip|

#. Click "*Save and Exit* to create the HTTP Load Balancer.

Once the HTTP Load Balancer has been deployed, you should now be able to go to the DNS name that you entered 
previously in a web browser.  The FQDN we used in our example is http://studentXX.sales-public.f5demos.com.  
Your FQDN should follow the format of [unique name].[supplied domain name for your tenant].

The public demo app should look like the following:

.. image:: frontend-public-vip.png

In this topology we are sending traffic to an AnyCast IP that is hosted in Volterra's Regional Edge.

We then connect to the AWS resource via it's Public IP address.  Next we will demonstrate how we 
can securely connect to your private AWS resources via a VoltMesh node.

Exercise 4: Private Origin Pool
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In this exercise we will create a new origin pool that connects to our AWS site via Volterra's 
Global Network.  

#. Navigate the menu to go to "Manage"->"Load Balancers"->"Origin Pools". Click on *Add Origin Pool*.
 
    |op-add-pool|

#. Enter the following variables:

    ================================= =====
    Variable                          Value
    ================================= =====
    Name                              frontend-private
    ================================= =====

#. Click on "Add Item" under Origin Servers

    ================================= =====
    Variable                          Value
    ================================= =====
    Select Type of Origin Server      DNS Name of Origin Server on given Sites
    DNS Name                          jumphost.lab.f5demos.internal
    Site                              student-awsnet
    Select Network on the site        Inside Network
    ================================= =====

    .. image:: op-pool-basic-private.png

    Click on "Add Item" to return to the previous screen

#. Enter "8080" for the Port
#. Select the http health check that you previously created

    .. image:: existing-health-check.png 

#. Click the *Save and Exit* button to create the Origin Pool.

Exercise 5: Edit HTTP Load Balancer Configuration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


#. Navigate the menu to go to "Manage"->"HTTP Load Balancers" and click on "..." next to the HTTP LB 
   that you previously created.

   .. image:: edit-http-lb.png

   then click on "Manage Configuration"

#. In the upper right click on "Edit Configuration"

#. Under "Default Origin Servers" click on "..." under the Actions column for your original Origin Pool (frontend-public) and select "Edit"
   
#. Select your "frontend-private" pool.

#. Click on "Apply"
#. Click on "Save and Exit"
#. Refresh your browser window for "studentxx.sales-public.f5demos.com" and you should now have access to a diagnostic tool that will let you explore the environment.

   .. image:: f5-demo-container.png

Exercise 6: Review General Monitoring Stats
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

We can also view analytics of our HTTP Load Balancer.

#. Navigate the menu to go to "Virtual Hosts"->"HTTP Load Balancers" and click on "Performance Monitoring" after hovering your mouse over "frontend"

  .. image:: http_lb_stats.png


.. |app-context| image:: app-context.png
.. |http_lb_menu| image:: http_lb_menu.png
.. |http_lb_add| image:: http_lb_add.png
.. |http_lb| image:: http_lb.png
.. |http_lb_origin_pool_config| image:: http_lb_origin_pool_config.png
.. |http_lb_origin_pool_health_check| image:: http_lb_origin_pool_health_check.png
.. |lb-basic| image:: lb-basic.png

.. |lb-default-origin| image:: lb-default-origin.png
.. |lb-route1| image:: lb-route1.png
.. |lb-op-api| image:: lb-op-api.png
.. |lb-route2| image:: lb-route2.png
.. |lb-vip| image:: lb-vip.png

.. |op-add-pool| image:: op-add-pool.png
.. |op-pool-basic| image:: op-pool-basic.png
.. |op-spa-check| image:: op-spa-check.png

.. |origin_pools_menu| image:: origin_pools_menu.png
.. |origin_pools_add| image:: origin_pools_add.png
.. |origin_pools_config| image:: origin_pools_config.png
.. |origin_pools_config_api| image:: origin_pools_config_api.png
.. |origin_pools_config_mongodb| image:: origin_pools_config_mongodb.png
.. |origin_pools_show_child_objects| image:: origin_pools_show_child_objects.png
.. |origin_pools_show_child_objects_status| image:: origin_pools_show_child_objects_status.png
.. |http_lb_origin_pool_health_check| image:: http_lb_origin_pool_health_check.png
.. |http_lb_origin_pool_health_check2| image:: http_lb_origin_pool_health_check2.png