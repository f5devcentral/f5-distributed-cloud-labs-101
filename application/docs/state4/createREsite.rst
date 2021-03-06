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

Exercise 2: Deploy the "Recommendations" Workload
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#. Navigate to your vK8s cluster from  in the *Virtual K8s* list

    |vk8s_list|

#. Click the Workloads tab

    |k8s_workloads_menu|

#. Click the *Add vK8s workload* button 

#. Enter the following variables:

    ======================= =====
    Variable                Value
    ======================= =====
    Name                    brews-spa
    Select Type of Workload Service
    ======================= =====

#. Under the *Service* section, click the *Configure* link

#. Enter the following variables in the *Containers* section 

    =============================== =====
    Variable                        Value
    =============================== =====
    Name                            brews-spa
    Image Name                      registry.f5demos.com/spa
    Select Container Registry       Private Registry
    Private Registry                Select the private registry you created previously
    =============================== =====

    |vk8s_workloads_containers|

#. Enter the following variables in the *Deploy Options* section 

    =============================== =====
    Variable                        Value
    =============================== =====
    Where to Deploy the workload    Customer Virtual Sites 
    =============================== =====

#. Under *Customer Virtual Sites*, click the *Configure* link

#. Select the Virtual Site you created in the previous section

#. Click the *Apply* button

#. Under *Advertise Option*, choose *Advertise In Cluster*

    |vk8s_workloads_advertise|

#. Enter the following variables:

    ==========  =====
    Variable    Value
    ==========  =====
    Port        8081
    ==========  =====

#. Click the *Apply* button

#. Click the *Apply* button

#. Click the *Save and Exit* button

Exercise 3: Create Virtual K8s Workload for the API
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#. Click the Workloads tab

    |k8s_workloads_menu|

#. Click the *Add vK8s workload* button 

#. Enter the following variables:

    ======================= =====
    Variable                Value
    ======================= =====
    Name                    brews-api
    Select Type of Workload Service
    ======================= =====

#. Under the *Service* section, click the *Configure* link

#. Enter the following variables in the *Containers* section 

    =============================== =====
    Variable                        Value
    =============================== =====
    Name                            brews-api
    Image Name                      registry.f5demos.com/api
    Select Container Registry       Private Registry
    Private Registry                Select the private registry you created previously
    =============================== =====

    |vk8s_workloads_containers_api|

#. Configuration

    #. Under the *Configuration* section click the *Add item* button
    #. Enter the following variables:

        =================================== =====
        Variable                            Value
        =================================== =====
        Select Configuration Parameter Type Environment Variable
        Name                                MONGO_URL
        Value                               your_namespace-mongodb.brews.local
        =================================== =====

        |vk8s_workloads_env|

#. Enter the following variables in the *Deploy Options* section 

    =============================== =====
    Variable                        Value
    =============================== =====
    Where to Deploy the workload    Customer Virtual Sites 
    =============================== =====

#. Under *Customer Virtual Sites*, click the *Configure* link

#. Select the Virtual Site you created in the previous section

#. Click the *Apply* button

#. Under *Advertise Option*, choose *Advertise In Cluster*

    |vk8s_workloads_advertise|

#. Enter the following variables:

    ==========  =====
    Variable    Value
    ==========  =====
    Port        8081
    ==========  =====

#. Click the *Apply* button

#. Click the *Apply* button

#. Click the *Save and Exit* button


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