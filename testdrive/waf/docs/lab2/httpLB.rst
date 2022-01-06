Creating HTTP Load Balancer on Volterra Regional Edge
=====================================================

Exercise 1: HTTP Load Balancer Configuration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#. Start in VoltConsole and switch to the Application context. 

    |app-context|

#. Navigate the menu to go to "Manage"->"HTTP Load Balancers" and click on "Add HTTP Load Balancers".

    |http_lb_menu| |http_lb_add|

#. Enter the following variables:

    ================================= =====
    Variable                          Value
    ================================= =====
    Name                              global
    Domains                           studentXX.sales-public.f5demos.com
    Select type of Load Balancer      HTTP
    Automatically Manage DNS Records  Yes/Check 
    ================================= =====

    |lb-basic|

Exercise 3: Configure Default Origin Server
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
We'll next configure the "Default Origin Servers". 
    
#. Click on the *Add Items* link under the *Default Origin Servers* section.

#. The "Select Origin Pool Method" will be set to "Origin Pool". Under the "Origin Pool" dropdown menu select the "public" pool you created earlier.
 
#. Click the *Add Item* button to exit the "Origin Pools" dialogue.

#. Notice that in the "VIP Creation" section *Advertise On Internet* has been selected by default.

    |lb-vip|

Exercise 4: Configure WAF Policy
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#. Under the *Security Configuration* section 

#. Enter the following variables:

    ============================================= =====================
    Variable                                      Value
    ============================================= =====================
    Select Web Application Firewall (WAF) Config  App Firewall
    App Firewall                                  blocking-app-firewall
    ============================================= =====================

#. Click "*Save and Exit* to create the HTTP Load Balancer.

Once the HTTP Load Balancer has been deployed, you should now be able to go to the DNS name that you entered 
previously in a web browser.  The FQDN we used in our example is http://studentXX.sales-public.f5demos.com.  
Your FQDN should follow the format of [unique name].[supplied domain name for your tenant].

Exercise 5: Verify Configuration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The public demo app should look like the following:

.. image:: frontend-public-vip.png

In this topology we are sending traffic to an AnyCast IP that is hosted in Volterra's Regional Edge.

We then connect to the AWS resource via it's Public IP address.  

Try adding the following to the URL "?cat%20/etc/passwd".

Exercise 6: Performance and Security 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

We can view details of successful requests and blocks by navigating to "Apps & APIs"

#. Click on "Apps & APIs"->"Performance" and click on your "global" Load Balancer.

   You will allow you to see a  health score of your application as well as end to end latency of the connection.

#. Click on "Requests" in the upper page navigation

   You should be able to view logs for individual requests.

You should now see a block page.  

Next we will demonstrate how we 
can securely connect to your private AWS resources via a VoltMesh node.

