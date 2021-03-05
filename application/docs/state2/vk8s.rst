Virtual Kubernetes
==================

In this section we will create a Virtual K8s configuration in VoltConsole.

#. In VoltConsole ensure you are in the *Application* context

    |app-context| 

#. Navigate the menu to go to *Application*->*Virtual K8s*

    |vk8s_menu|

#. Click the *Add Virtual K8s* button

#. Enter the following variables: 

    ======== =====
    Variable Value
    ======== =====
    Name     your_namespace-vk8s
    ======== =====

#. Click the *Select Vsite Ref* button

#. Select the Virtual Site you created

#. Click the *Select Vsite Ref* button

    |vk8s_vsite_ref|

#. Click the *Save and Exit* button

VoltConsole will now create your Virtual K8s cluster.

|vk8s_cluster| 

.. |app-context| image:: ../_static/app-context.png
.. |vk8s_menu| image:: ../_static/vk8s_menu.png
.. |vk8s_vsite_ref| image:: ../_static/vk8s_vsite_ref.png
.. |vk8s_cluster| image:: ../_static/vk8s_cluster.png
