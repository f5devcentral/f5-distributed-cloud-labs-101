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

TBD
#. Under *Advertise Option*, choose *Advertise In Cluster*. Click the *Configure* link.

    |recs-advertise|

#. Fill out the dialogue. Click the *Configure* link.

    ==========              =====
    Variable                Value
    ==========              =====
    Port                    8002
    Application Protocol    TCP
    Options                 HTTP/HTTPS Load Balancer
    ==========              ====

#. Fill out the "Basic Configuration" dialogue for the load balancer.

    |recs-lb-basic|

#. Toggle the "Show Advanced Fields" button in the "Routes Configuration". Remove the pre-populated "Default Route" by clicking the "x".

    |recs-route-toggle| |recs-route-remove|

TBD
#. Click the *Apply* button to save the "Load Balancer" configuration.

#. Click the *Apply* button to save the "Advertise" configuration.

#. Click the *Apply* button to save the various workload options dialogue.

#. Click the *Save and Exit* button to create the workload.

#. Verify the workload.

    |rec-wl-verify1|    |rec-wl-verify2|

Exercise 4: Reconfigure the Load Balancer to route to "Recommendations" service
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Exercise 5: Reconfigure the SPA to use the "Recommendations" feature.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~




You should now see your two worloads with 1 Running/Completed Pods per workload.

|vk8s_workloads_list|

.. |lu-ns| image:: ../_static/lu-ns.png
.. |menu-vs| image:: ../_static/menu-vs.png
.. |add-vs| image:: ../_static/add-vs.png
.. |add-vs-diag| image:: ../_static/add-vs-diag.png
.. |add-vs-button| image:: ../_static/add-vs-button.png
.. |verify-vs| image:: ../_static/verify-vs.png
.. |vs-check| image:: ../_static/vs-check.png
.. |vs-selector-expression| image:: ../_static/vs-selector-expression.png