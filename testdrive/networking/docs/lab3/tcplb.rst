TCP Load Balancer
=================

On of the requirements from the "Narrative" is to enable the frontend application
in AWS to communicate with the backend application that is on-prem.

The frontend application makes use of DNS to determine the IP address of the backend
application.  In the on-prem environment the name "studentXX.example.internal" resolves to
the backend IP of 10.1.20.5.

In the AWS environment we want to resolve the name "studentXX.example.internal" to resolve to
the IP address of the Volterra Gateway (VG).  The VG will host a Virtual IP (VIP) that will
host a TCP Load Balancer that will proxy traffic back to the original backend application.

.. image:: tcplb-lab.png

Exercise 1: Verify DNS 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In the previous lab exercise we made a "In Container Diagnostic Services" service available.

This is small application that allows you to run tools to verify DNS and run commands like "curl"
to simulate HTTP/HTTPS connections from inside the AWS environment.

#. Click on DNS Lookup
#. After the "@" replace the 10.0.5.xxx value with "10.0.0.2"
#. Enter "jumphost.lab.f5demos.internal"
#. Click on Lookup

   .. image:: dns-lookup-jumphost.png

You'll see that the private IP of the jumphost is returned.  The Distributed Cloud Mesh node used the 
internal DNS of your AWS site to resolve the IP of the private jumphost and made use of the 
secure tunnel to the Distributed Cloud Regional Edge to expose the service.

Next we will verify that we do not have a DNS record for studentXX.example.internal

#. Refresh your browser window
#. Click on DNS Lookup
#. Verify that you see "10.0.5.xxx" after the "@"
#. Enter "studentXX.example.internal" (replace studentXX with your student ID i.e. student01)
#. Click on Lookup

You should receive an error.  You should look for "SERVFAIL" that indicates the name does not exist.

.. code-block::
        
    ; <<>> DiG 9.16.1-Ubuntu <<>> @10.0.5.220 student002.example.internal A
    ; (1 server found)
    ;; global options: +cmd
    ;; Got answer:
    ;; ->>HEADER<<- opcode: QUERY, status: SERVFAIL, id: 22347
    ;; flags: qr rd; QUERY: 1, ANSWER: 0, AUTHORITY: 0, ADDITIONAL: 0
    ;; WARNING: recursion requested but not available

    ;; QUESTION SECTION:
    ;student002.example.internal.	IN	A

    ;; Query time: 3 msec
    ;; SERVER: 10.0.5.220#53(10.0.5.220)
    ;; WHEN: Thu Mar 03 05:02:49 UTC 2022
    ;; MSG SIZE  rcvd: 45


Exercise 2: Origin Pool
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


#. Navigate the menu to go to *Manage* -> *Load Balancer*, then click *Origin Pools*.

    |origin_pools_menu|

#. Click the *Add Origin Pool* button.

    |origin_pools_add|
    
#. Enter the following variables:

=============================== ===============
Variable                        Value
=============================== ===============
Origin Pool Name                backend
=============================== ===============

#. Click on "Add Item" under Origin Servers
#. Enter the following variables:

=============================== ===============
Select Type of Origin Server    IP address of Origin Server on given Sites
IP address                      10.1.20.5
Site                            Your UDF site
Select Network on the site      Inside Network
=============================== ===============

Click on "Add Item" to return to the previous screen

#. Enter "8443" for the Port

#. Under the *List of Health Check(s)* section, click the *Select healthcheck* dropdown.

#. Click the *Create new Healthcheck* button.

#. Enter the following variables:

=============================== ===============
Variable                        Value
=============================== ===============
Name                            tcp
Health Check                    TCP HealthCheck
=============================== ===============

#. Click on the "Configure" button to open the dialog to adjust timeout settings then click "Apply"
#. Click the *Continue* button to close the *Health Check Parameters* dialogue. 

#. Click the *Save and Exit* button to close the *Origin Pool* dialogue.

Exercise 3: Create Backend TCP Load Balancer
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


#. Navigate the menu to go to *Manage* -> *Load Balancer*, then click *TCP Load Balancers*.

    |tcp_lb_menu|

#. Click the *Add TCP Load Balancer* button.

#. Enter the following variables:

    ==============================  =====
    Variable                        Value
    ==============================  =====
    Name                            backend
    Domain                          studentXX.example.internal
    Listen Port                     443
    With SNI                        Checked
    Where to Advertise the VIP      Advertise Custom
    ==============================  =====

#. Configure Origin Pools

    #. Under the *Origin Pools* section, click the *Add Item* link.
    #. Select the *backend* pool.
    #. Click the *Add Item* button to close the *Origin Pools* dialogue.

#. Configure Advertisement 

    #. Under *Advertise Custom* click the *Configure* link.
    #. Click on "Add Item"
    #. You will need to add a site:
            
            =========================== =====
            Variable                    Value
            =========================== =====
            Select Where to Advertise   Site
            Site Network                Inside Network
            Site Reference              student-awsnet
            =========================== =====


        |tcp_lb_advertise|

    #. Click the *Add Item* button to exit the *Advertise Custom* dialogue.
    #. Click on "Apply"

    |tcp_lb_config|

#. CLick the *Save and Exit* button to exit the *TCP Load Balancer* dialogue.

Exercise 4: Verify DNS Again
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Volterra Gateway provides a recursive DNS resolver.  You can either point a client
directly at the gateway or forward DNS queries that you would like Volterra to process.

Using the "In Container Diagnostic Services"

#. Click on DNS Lookup
#. Enter "studentXX.example.internal" (replace studentXX with your student ID i.e. student01)
#. Click on Lookup

You should no longer get an error.

Exercise 5: Connect to the backend
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In this exercise we will emulate how a distributed application could access a resource that 
resides in another remote network via the Distributed Cloud Global Network.

Using the "In Container Diagnostic Services"

#. Click on "Run Command"
#. Enter "curl -sk https://studentXX.example.internal" (replace studentXX with your student ID i.e. student01)
#. Click on Run Command

You should see an output.  Now try repeating the same but using the IP address that you retrieved in Exercise 4.

#. Click on "Run Command"
#. Enter "curl -sk https://10.0.3.XX" (replace XX with the value your retrieved in Exercise 4)
#. Click on Run Command

You should see an error.  This is because Distributed Cloud is expecting an SNI value.  This allows you to re-use
the same IP address for multiple different services.

This concludes showing how we can solve Multi Cloud Networking with the use of Volterra Load Balancer resources.

We can also make use of Distributed Cloud "Global Networks" to provide routed connectivity between networks (requires non-overlapping IP space).

If you are interested in learning more about Global Networks you can use the following Distributed Cloud simulator: https://simulator.f5.com/s/cloud2cloud_via_sites

Thank you for completing the lab!



.. |app-context| image:: app-context.png
.. |tcp_lb_menu| image:: tcp_lb_menu.png
.. |tcp_lb_config| image:: tcp_lb_config.png
.. |tcp_lb_advertise| image:: tcp_lb_advertise.png
.. |origin_pools_menu| image:: origin_pools_menu.png
.. |origin_pools_add| image:: origin_pools_add.png
.. |origin_pools_config_mongodb| origin_pools_config_mongodb.png
