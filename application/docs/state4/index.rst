State 4
========
The DemoBrews executive team has determined the company can increase 
revenue per transaction by adding a "recommendations" service to the app. 
Being in a rush to launch the service, the dev team skipped the required regression 
and load testing procedures for adding functionality to the API service.
In the meantime, the service will need to be deployed to two geographically diverse Volterra Regional Edges (REs).

Section Goals
-------------
We will deploy the "recommendations" service to Seattle and New York based REs. As part of the workload deployment
we will expose this service to the internet with an HTTP load balancer.

In this state we will configure the following VoltConsole components:

- A virtual site as a deployment target for our vK8s workload
- vk8s workload containing the "recommendations" service

Data Flow and Architecture
--------------------------
The logical application data flow now includes the "Recommendations" service.

|state4|

The architecture is now spread across CEs as well as Volterra REs.

|arch4|

.. toctree::
   :maxdepth: 1
   :caption: Contents:

   createREsite
   deployWorkload


.. |state4| image:: ../_static/LabAppFlow4.png
.. |arch4| image:: ../_static/LabArch4.png