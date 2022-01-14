Update HTTP Load Balancer on Volterra Regional Edge
=====================================================

We will now update the HTTP load balancer that we previously created to connect to
the "Private Endpoint" via the VoltMesh node that is deployed in the AWS lab environment.

.. image:: ../_static/testdrive-volterra-waf-hybrid-vip.png

Exercise 1: HTTP Load Balancer Configuration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#. Start in VoltConsole and switch to the "Web App & API Protection" context. [You should already be here from previous lab]

#. Navigate the menu to go to "Manage"->"HTTP Load Balancers" and look for the Load Balancer named *global* that you previously created.

#. Click on the three dots "..." to the right of the name of your *global* Load Balancer and select the "Manage Configuration" option.
   
   .. image:: ../_static/screenshot-global-vip-actions-manage.png
#. Click on "Edit Configuration" in the upper right of the screen (after your *global* Load Balancer is loaded).
   
   .. image:: ../_static/screenshot-global-vip-edit-config.png
#. Under "Default Origin Servers" find you previous "public" Origin pool and click on the three dots "..." to the right under "Actions"
   
   .. image:: ../_static/screenshot-global-vip-edit-config-pools.png
#. Change the selection of "Origin Pool" to "private" from "public" and click "Apply"
   
   .. image:: ../_static/screenshot-global-vip-edit-config-pools-select.png
#. Click "*Save and Exit* to update the HTTP Load Balancer.

You should now be able to go to the DNS name that you entered 
previously in a web browser.  The FQDN we used in our example is http://studentXX.sales-public.f5demos.com.  

Exercise 5: Verify Configuration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The private demo app should look like the following:

.. image:: ../_static/screenshot-global-vip-private.png
    :width: 50%

In this topology we are sending traffic to an AnyCast IP that is hosted in Volterra's Regional Edge.

We then connect to the AWS resource via the VoltMesh node that is deployed in the same VPC as the "Private Endpoint".  
The VoltMesh is only being used for network connectivity to the Private Endpoint; enforcement of the WAF policy is still
being applied in the Regional Edge.

In the next exercise we will look at a third topology of deploying a WAF policy that will be enforced within the AWS VPC
on the VoltMesh node (in the Customer Edge).

.. raw:: html
   
   <iframe width="560" height="315" src="https://www.youtube.com/embed/s-BHH0Qayfc?start=366" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
