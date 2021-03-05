State 3
=======
DemoBrews would like to enable their customers to pick up orders in their brick and mortar stores. 
In order to determine which products are available at which locations, the dev team has built an "inventory" service.
Without approval, the dev team used the on-prem data center for testing the service. 
The production Inventory service will need to run at each site and be accessed by the API service.  

Section Goals
-------------
We will connect the API service to the inventory service in each site, with a preference for the site 
local inventory service.  

In this state we will configure the following VoltConsole components:
- HTTP Load Balancer
- Origin Pool

Data Flow and Architecture
--------------------------
The logical application data flow now includes the Inventory service.

|state3|

The architecture continues to be spread across CEs and rely on the Volterra ADN. 
This state includes the new internally available Inventory service.

|arch3|

.. toctree::
   :maxdepth: 1
   :caption: Contents:

   voltconsole
   httplb

.. |state3| image:: images/state2.png
.. |arch3| image:: images/arch2.png