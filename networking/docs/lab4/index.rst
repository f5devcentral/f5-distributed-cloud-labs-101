Lab 4: Configure Site Networking
================================

During this lab you will use VoltConsole to

- Create a fleet
- Create a Network Connector

During the previous lab you connected two sites using proxy resources (TCP/HTTP LB).

This next lab will connect the two sites via routing.  This is only possible when 
the two sites do not have overlapping IP space.  It is preferred to connect via 
service endpoints to provider greater flexibility/security of services.  Using 
routing can be used when an application is unable to work with a proxied resource.

.. toctree::
   :maxdepth: 1
   :caption: Contents:

   virtual-network
   network-connector
   fleet


