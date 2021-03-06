Origin Pools
=========================

In this section we will create the Origin Pools for the new vK8S deployment.


Exercise 1: Create SAP Origin Pools
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#. In VoltConsole ensure you are in the *Application* context

    |app-context| 

#. Navigate the menu to go to *Manage*->*Load Balancer*, then click *Origin Pools*

    |origin_pools_menu|

#. Click the *Add Origin Pool* button

    |origin_pools_add|
    
#. Enter the following variables:

    ==============================  =====
    Variable                        Value
    ==============================  =====
    Name                            brews-aws-spa
    Select Type of Origin Server    K8s Service Name of Origin Server on given Sites
    Service Name                    brews-spa.your_namespace
    Select Site or Virtual Site     Virtual Site
    Site                            The virtual site you created earlier 
    Select Network on site          vK8s Networks on Site
    Port                            8081
    ==============================  =====

    |origin_pools_config|

#. Under the *List of Health Check(s)* section, click the *Add item* button

#. Select the brew-spa health check you created earlier

#. Click the *Save and Exit* button


Exercise 2: Create API Origin Pools
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In this exercise, you will repeat the steps from exercise one but for the API vK8s service.

The following variables will need to be changed:

==================  =====
Variable            Value
==================  =====
Origin Pool Name    brews-aws-api
Service Name        brews-api.your_namespace
Port                8000
Health Check        brews-api
==================  =====

|origin_pools_config_api|

Exercise 3: Troubleshoot Origin Pools
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#. Click on the *...* link for the pool you would like to troubleshoot

#. Click the *Show Child Objects* button

    |origin_pools_show_child_objects|

#. Click on the *Status* tab

#. Select your AWS Site

#. Validate that the JSON payload shows that *Validation* is *Sucessful* and *Operational* is *Installed*

    |origin_pools_show_child_objects_status|


.. |app-context| image:: ../_static/app-context.png
.. |origin_pools_menu| image:: ../_static/origin_pools_menu.png
.. |origin_pools_add| image:: ../_static/origin_pools_add.png
.. |origin_pools_config| image:: ../_static/origin_pools_config.png
.. |origin_pools_config_api| image:: ../_static/origin_pools_config_api.png
.. |origin_pools_show_child_objects| image:: ../_static/origin_pools_show_child_objects.png
.. |origin_pools_show_child_objects_status| image:: ../_static/origin_pools_show_child_objects_status.png