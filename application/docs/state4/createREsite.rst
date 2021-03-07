Custom Regional Edge Site
==========================

Exercise 1: Create a Regional Edge Virtual Site
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#. Start in VoltConsole and switch to your "Application" namespace.

    |lu-ns|

#. Using the menu on the left, navigate to "Applications"->"Virtual Sites". Click on "Add virtual site".

    |menu-vs| |add-vs|

#. Configure the "Virtual Site".

    ================================= =====
    Variable                          Value
    ================================= =====
    Name                              recs-re
    Description                       virtual site to deploy 'recs' service
    Site Type                         RE
    Site Selector Expression          ves.io/siteName in {ves-io-ny8-nyc, ves-io-wes-sea}
    ================================= =====

    |vs-selector-expression| |add-vs-diag| |add-vs-button|

#. Verify your *recs-re* virtual site was created.

    |vs-check| |verify-vs|


Exercise 2: Add your "Virtual Site" to vK8s (this seems unnecessary)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Before we can deploy the "Recommendations" service to the REs, we need to add the virtual site we just
created to our vK8s cluster.

#. Navigate to your vK8s cluster from the *Virtual K8s* menu item under "Applications". Click on *Select Virtual Sites*.

    |vk8s-select-vs|

#. Add the "recs-re" virtual site you just created.

    |vk8s-add-recs-site|

Exercise 3: Deploy the "Recommendations" Workload
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#. Navigate to your vK8s cluster from the *Virtual K8s* menu item under "Applications".

    |vk8s_deets|

#. Click the Workloads tab

    |k8s_workloads_menu|

#. Click the *Add vK8s workload* button 

    |placeholder|

#. Enter the following variables:

    ======================= =====
    Variable                Value
    ======================= =====
    Name                    brews-recs
    Select Type of Workload Service
    ======================= =====

#. Under the *Service* section, click the *Configure* link

#. Enter the following variables in the *Containers* section 

    =============================== =====
    Variable                        Value
    =============================== =====
    Name                            brews-recs
    Image Name                      registry.f5demos.com/recs
    Select Container Registry       Private Registry
    Private Registry                Select the private registry you created previously
    =============================== =====

    |recs-container|

#. Enter the following variables in the *Deploy Options* section 

    =============================== =====
    Variable                        Value
    =============================== =====
    Where to Deploy the workload    Customer Virtual Sites 
    =============================== =====

#. Under *Customer Virtual Sites*, click the *Configure* link

#. Select the Virtual Site you created in the previous section

    |recs-vs|

#. Click the *Apply* button.

#. Under *Advertise Option*, choose *Advertise In Cluster*. This will create a k8s service.

    |recs-advertise|

TBD
#. Click the *Apply* button to save the "Load Balancer" configuration.

#. Click the *Apply* button to save the "Advertise" configuration.

#. Click the *Apply* button to save the various workload options dialogue.

#. Click the *Save and Exit* button to create the workload.

#. Verify the workload.

    |rec-wl-verify1|    |rec-wl-verify2|

Exercise 4: Reconfigure the SPA Load Balancer
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Now that our "Recommendations" service is running in the REs, we need to configure method of sending it client traffic.
We are already using the SPA load balancer to route traffic to various "Origin Pools" based on HTTP URI. To keep a single
point of ingress into our app let's reconfigure this load balancer.

#. Navigate to *Origin Pools* under the "Management" section in your App namespace.

    |manage-origin|

#. Click on *Create a new Origin Pool*.

#. Follow the dialogue.

#. Create a new "Route" to target the new "Origin Pool".


Exercise 5: Reconfigure the SPA to use the "Recommendations" feature.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Now that "Recommendations" service is online, we need to reconfigure the SPA to use it. 

#. Open the demo application in your browser

    .. note:: If you do not remember the FQDN, you can look under *Manage* -> *Load Balancers* to get it.

#. Click on the information icon

    |demo_app_stats|

#. Click on the gear icon for the "Recommendations" service.

    |demo_app_config_db|

#. Enter the route we added to the SPA HTTP load balancer.

    |demo_app_config_db_url|

#. Click the button or press Enter

If everything is working correctly, your "Recommendations" card should not turn red.
When you view product details, you should see some additional brew recommendations.


.. |lu-ns| image:: ../_static/lu-ns.png
.. |menu-vs| image:: ../_static/menu-vs.png
.. |add-vs| image:: ../_static/add-vs.png
.. |add-vs-diag| image:: ../_static/add-vs-diag.png
.. |add-vs-button| image:: ../_static/add-vs-button.png
.. |verify-vs| image:: ../_static/verify-vs.png
.. |vs-check| image:: ../_static/vs-check.png
.. |vs-selector-expression| image:: ../_static/vs-selector-expression.png