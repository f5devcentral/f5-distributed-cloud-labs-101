HTTP Load Balancer
==================

Now that we have connected the UDF Site to the Volterra Global Network we
will expose the applications in the UDF site using a Regional Edge and HTTP
Load Balancer.

Terminology
~~~~~~~~~~~~~

Regional Edge
  A Regional Edge (RE) is part of Voltera global network that provides connectivity to services.  


Demo Brews Application
~~~~~~~~~~~~~~~~~~~~~~~

Now you are ready to set up an HTTP Load Balancer to serve the single-page application, the API server and the static images.

Exercise 1: Create an HTTP Load Balancer
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#. Start in VoltConsole and switch to the Application context. 

    |app-context|

#. Navigate the menu to go to "Manage"->"HTTP Load Balancers" and click on "Add HTTP Load Balancers".

    |http_lb_menu| |http_lb_add|

#. Configure HTTP Load Balancer

    Now you will create a HTTP load balancer configuration. Enter the following variables:

    ================================= =====
    Variable                          Value
    ================================= =====
    Name                              brews
    Domains                           [unique name]-brews.[supplied domain name for your tenant]
    Select type of Load Balancer      HTTP
    Automatically Manage DNS Records  Yes/Check 
    ================================= =====

    |http_lb|

    .. note::
      If you are not set up with a delegated domain you can disable the option to automatically manage DNS records.
      You can supply an arbitrary domain (example.com) and later you can use the following
      command to verify

      .. code-block::
        
        $ curl --resolve [unique-name]-brews.example.com:80:[IP address of ves.io name created by LB] http://[unique-name]-brews.example.com

Exercise 2: Configure Default Origin Server
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    Now you will configure the Default Origin Server used by the load balancer.  
    
    #. Click on the *Configure* link under the *Default Origin Servers* section.

    #. Click the *Add Item* button.

    #. In the Origin Pool drop down, click *Create new pool* 

    #. Enter the following variables:

      ================================= =====
      Variable                          Value
      ================================= =====
      Name                              brews-spa-pool
      Select Type of Origin Server      IP address of Origin Server on given Sites
      IP                                10.1.1.4
      Site                              the UDF site name configured in the previous lab
      Select Network on the site        Outside Network
      Port                              8081
      ================================= =====

      |http_lb_origin_pool_config|

#. Configure Origin Pool Health monitor
    #. In the *List of Health Check(s)* section click the *Add item* button.
    #. Click the *Health Check object* dropdown list 
    #. Click the *Create new healthcheck* button
    #. Enter the following variables:

        ========= =====
        Variable  Value
        ========= =====
        name      brews-spa
        ========= =====

        |http_lb_origin_pool_health_check|

    #. Click the *configure* button under HTTP Health Check and enter the following variables:

        ========= =====
        Variable  Value
        ========= =====
        path      /products
        ========= =====

      |http_lb_origin_pool_health_check2|
    
    #. Click the *Apply* button
    #. Click the *Continue* button
    #. Click the *Continue* button
    #. Click the *Apply* button

Exercise 3: Configure Routes
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    Now we're ready to configure URL-based pool selection for the API server and the static images.  To acheive this we will use 
    the Load Balancer Routes configuration.  
    
    #. In the *Routes Configuration* section toggle the *Show Advanced Fields* button.
    #. Click the *Configure* link 

        |http_lb_routes|

    #. Click the *Add item* button

    #. Enter the following variables:

        =========== =====
        Variable    Value
        =========== =====
        HTTP Method ANY
        Prefix      /api/
        =========== =====

        |http_lb_routes_prefix_1|

    #. Under the *Origin Pools* section Click the *Configure* link
    #. Click the *Add item* button
    #. Under the *Origin Pool* section select the dropdown and click *Create new pool*
    #. Enter the following variables:

        ================================= =====
        Variable                          Value
        ================================= =====
        Name                              brews-api-pool
        Select Type of Origin Server      IP address of Origin Server on given Sites
        IP                                10.1.1.4
        Site                              the site name configured in the previous lab
        Select Network on the site        Outside Network
        Port                              8000
        ================================= =====

        |http_lb_routes_prefix_pool|

    #. Under the *List of Health Check(s) section, click the *Add item* button
    #. In the *Health Check object* dropdown, click the *Create new healthcheck* button 
    #. Enter the following variables:

        =========== =====
        Variable    Value
        =========== =====
        Name        brews-api
        =========== =====

    #. Under the *HTTP HealthCheck* section, click the *Configure* link.
    #. Enter the following variables:

        =========== =====
        Variable    Value
        =========== =====
        Path        /api/stats
        =========== =====

        |http_lb_routes_prefix_pool_health|

    #. Click Continue
    #. Click Apply
    #. Under the *Routes* section, click the *Add item* button
    #. Enter the following variables:

        =========== =====
        Variable    Value
        =========== =====
        HTTP Method ANY
        Prefix      /images/
        =========== =====

        |http_lb_routes_prefix_2|

    #. Under the *Origin Pools* section, click the *Configure* button
    #. Under the *Origin Pools* section, click the *Add item* button
    #. In the *Origin Pool* dropdown, select *brews-api-pool*
    #. Click Apply 

        You should now have two routes configured:
          - One for /api/
          - One for /images/

    #. Click Apply

    #. Click Save and Exit


You should now be able to go to the DNS name that you entered 
previously in a web browser.


.. |app-context| image:: ../_static/app-context.png
.. |http_lb_menu| image:: ../_static/http_lb_menu.png
.. |http_lb_add| image:: ../_static/http_lb_add.png
.. |http_lb| image:: ../_static/http_lb.png
.. |http_lb_origin_pool_config| image:: ../_static/http_lb_origin_pool_config.png
.. |http_lb_origin_pool_health_check| image:: ../_static/http_lb_origin_pool_health_check.png
.. |http_lb_origin_pool_health_check2| image:: ../_static/http_lb_origin_pool_health_check2.png
.. |http_lb_routes| image:: ../_static/http_lb_routes.png
.. |http_lb_routes_prefix_1| image:: ../_static/http_lb_routes_prefix_1.png
.. |http_lb_routes_prefix_pool| image:: ../_static/http_lb_routes_prefix_pool.png
.. |http_lb_routes_prefix_pool_health| image:: ../_static/http_lb_routes_prefix_pool_health.png
.. |http_lb_routes_prefix_2| image:: ../_static/http_lb_routes_prefix_2.png
