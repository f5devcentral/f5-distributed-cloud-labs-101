Virtual Kubernetes
==================

In this section we will create an additional Virtual K8s workload.

Exercise 1: Create Virtual K8s Workload for the Inventory
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#. Navigate to the Virtual K8s cluster you created earlier under "Applications" -> "Virtual K8s". Click on the cluster name.
 
#. Click the Workloads tab.

    |k8s_workloads_menu|

#. Click the *Add vK8s workload* button. 

#. Enter the following variables:

    ======================= =====
    Variable                Value
    ======================= =====
    Name                    brews-inv
    Select Type of Workload Service
    ======================= =====

#. Under the *Service* section, click the *Configure* link.

#. Enter the following variables in the *Containers* section:

    =============================== =====
    Variable                        Value
    =============================== =====
    Name                            brews-inv
    Image Name                      registry.f5demos.com/inv
    Select Container Registry       Private Registry
    Private Registry                Select the private registry you created previously
    =============================== =====

#. Enter the following variables in the *Deploy Options* section: 

    =============================== =====
    Variable                        Value
    =============================== =====
    Where to Deploy the workload    Customer Virtual Sites 
    =============================== =====

#. Under *Customer Virtual Sites*, click the *Configure* link.

#. Select the Virtual Site you created in the previous section.

#. Click the *Apply* button to close the "Customer Virtual Sites" dialogue.

#. Under *Advertise Option*, choose *Advertise In Cluster*. Click the "*Edit* button.

    |vk8s_workloads_advertise|

#. Enter the following variables:

    ==========  =====
    Variable    Value
    ==========  =====
    Port        8002
    ==========  =====

#. Click the *Apply* button to close the "Advertise In Cluster" dialogue.

#. Click the *Apply* button to close the "Service" dialogue.

#. Click the *Save and Exit* button to create the Workload.

.. |k8s_workloads_menu| image:: ../_static/k8s_workloads_menu.png
.. |vk8s_workloads_advertise| image:: ../_static/vk8s_workloads_advertise.png