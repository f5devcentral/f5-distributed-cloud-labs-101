Virtual Network
===============

The first network configuration task is to define a Virtual Network.  This 
will define how sites will connect to each other and whether they will
advertise network routes between sites or rely on source address translation.

Exercise 1: Create Virtual Network
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

From the "System" namespace go under "Site Management"->"Networking"-"Virtual Networks".

.. image:: virtual-network-menu.png

Click on "Add Virtual Network".

Provide a name, i.e. ([your namespace]-global) and specify "Global Network"
as the specified type.  This will allow the sites to extend their network 
into other sites (requires non-overlapping IP space accross sites).  You can
also specify a network type of "Site Local" to specify that you want the 
network to be specific to the Site (not shared).

Click on "Save and Exit"