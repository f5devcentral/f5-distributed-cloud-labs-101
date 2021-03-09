Deploy Workload to vK8s
========================
With the environment prepped, the DemoBrews dev team is focused on getting the application deployed.
The DemoBrews CTO recently attended a weekend retreat with the local Azure account team. 
She has started engaging engineering teams on what it would take to switch Cloud Service Providers (CSPs) away from AWS.
The Dev team demands that we design a deployment procedure that allows for scaling across sites in different CSPs.

Section Goals
-------------
Initially, we will deploy the SPA and API services to the AWS site using the Virtual Site and Virtual Kubernetes abstractions. 
Next, we will expose the front-end (SPA) service and API services running in the AWS site to the internet along with the on-premise 
versions of those services.

In this section we will configure the following VoltConsole components:

- Virtual Site
- Virtual k8s (vK8s)
- 2 x vK8s Workloads
- Update existing Origin Pools


Data Flow and Architecture
--------------------------
The logical application data flow will change subtly from its earlier state.
The SPA and API services will now target services presented to each respective site.

|state2|

The architecture will now be spread across Customer Edge (CE) sites -- the on-premise and AWS sites. Each site will 
host the SPA and API services while the on-premise site will solely host the database.

|arch2|

.. toctree::
   :maxdepth: 1
   :caption: Contents:

   vsite   
   containerRegistry
   vk8s
   updateOrigPool

.. |state2| image:: ../_static/LabAppFlow2.png
.. |arch2| image:: ../_static/LabArch2.png
