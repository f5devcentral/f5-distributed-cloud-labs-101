State 4
========
The DemoBrews executive team has determined the company can increase 
revenue per transaction by adding a "recommendations" service to the app. 
Being in a rush to launch the service, the dev team skipped the required regression 
and load testing procedures for adding functionality to the API server.
The service will need to be deployed to two geographically diverse Volterra Regional Edges (REs) 
in the meantime.

Section Goals
-------------
We will deploy the "recommendations" service to Seattle and New York based REs. We will then expose the service
to the internet.

In this state we will configure the following VoltConsole components:
- vk8s workload containing the "recommendations" service
- HTTP Load Balancer

Data Flow and Architecture
--------------------------
The logical application data flow now includes the Recommendations service.

|state3|

The architecture is now spread across CEs as well as Volterra REs.

|arch3|

.. toctree::
   :maxdepth: 1
   :caption: Contents:

   voltconsole
   httplb

.. |state3| image:: images/state2.png
.. |arch3| image:: images/arch2.png