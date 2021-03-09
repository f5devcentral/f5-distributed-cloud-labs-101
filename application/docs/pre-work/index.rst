Site Creation and Registration
===============================
The first step to helping DemoBrews build a modern and flexible architecture to distribute the app
is creating Volterra sites in locations where they host infrastructure. This will include their on-prem
data center (your UDF deployment) and an AWS site hosted in the UDF cloud credentials account. 

.. note:: 
   
   To help avoid long waits during the lab, please complete the following steps first since they will take 10-15 minutes.

Section Goals
-------------
The customer's application is only available through their on-premise data center.
We need to create a Volterra site in the on-prem data center in order to expose the application
to the Volterra Global Network. In addition, we will create a VoltStack site in AWS for future application growth. 

In this section we will configure the following VoltConsole components:

- 1 x VoltMesh based site in UDF
- 1 x VoltStack based site in AWS


.. toctree::
   :maxdepth: 1
   :caption: Contents:

   voltconsole
   voltAwsSite
   delegatedDomains