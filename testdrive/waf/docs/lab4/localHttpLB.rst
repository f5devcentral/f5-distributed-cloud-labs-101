Creating HTTP Load Balancer on Volterra Customer Edge
=====================================================

In the previous lab exercises we were connecting to a Volterra Load Balancer that was deployed in a Regional Edge.

In the next lab exercise we will deploy a Load Balancer on the VoltMesh node that was deployed in the AWS VPC (Customer Edge location).

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
    Name                              local
    Domains                           studentXX.aws.lab.f5demos.com
    Select type of Load Balancer      HTTP
    Automatically Manage DNS Records  No/Unchecked 
    ================================= =====

    |lb-basic|

Exercise 3: Configure Default Origin Server
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
We'll next configure the "Default Origin Servers".   
    
#. Click on the *Add Items* link under the *Default Origin Servers* section.

#. The "Select Origin Pool Method" will be set to "Origin Pool". Under the "Origin Pool" dropdown menu select the "public" pool you created earlier.
 
#. Click the *Add Item* button to exit the "Origin Pools" dialogue.

Exercise 4: Configure Local VIP
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Previously we configured a VIP that was advertised on F5's Regional Edge (PoP) locations.
We will modify this configuration to expose the service on the "Outside" interface of the VoltMesh
node that is deployed in AWS.  This will allow us to access the VIP via the Public IP Address (AWS Elastic IP)
that is attached to that interface.  If we wished to only have the service available within the AWS VPC
we could opt to use the "Inside" interface that does not have an AWS EIP attached.

#. Under "VIP Creation" click on "Advanced Fields".
#. From "Where to Advertise the VIP" select "Advertise Custom"
#. Click on "Configure" under "Advertise Custom"
#. Next to "Custom Advertise VIP Configuration" click on "Show Advanced Fields"
#. Click on "Add Item"
#. For "Site Network" click on "Outside Network" 
#. For "Site Reference" select `student-aws`
#. Click on "Add Item" to return to previous screen


Exercise 5: Configure WAF Policy
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
previously in a web browser.  The FQDN we used in our example is http://studentXX.aws.lab.f5demos.com.  
This is a wildcard DNS entry that points to the Public IP (AWS Elastic IP) that is attached to the VoltMesh node.

Exercise 5: Verify Configuration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The private demo app should look like the following:

.. image:: frontend-public-vip-private.png

In this topology we are sending traffic to the AWS EIP that attached to the VoltMesh node in the AWS VPC.

We then connect to the AWS resource via it's Private IP address.  

Try adding the following to the URL "?cat%20/etc/passwd".

Exercise 6: Performance and Security 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

We can view details of successful requests and blocks by navigating to "Apps & APIs"

#. Click on "Apps & APIs"->"Performance" and click on your "local" Load Balancer.

   You will allow you to see a  health score of your application as well as end to end latency of the connection.

#. Click on "Requests" in the upper page navigation

   You should be able to view logs for individual requests.

You should now see a block page.  

Congratulations you have completed the lab!