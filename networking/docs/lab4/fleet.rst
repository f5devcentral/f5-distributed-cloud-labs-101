Fleet
=====

A fleet represents a network configuration for a site.  It can make use of
dynamic network elements (i.e. DHCP) to provide a template for each site
without requiring to hardcode specific static network information.

Exercise 1: Create a Fleet
~~~~~~~~~~~~~~~~~~~~~~~~~~

Under the System namespace "Site Management"->"Site Management" click on "Fleets".

You will need to provide the following information.

- Fleet Name: [unique namespace]-udf
- Fleet Label: [unique namespace]-udf
- Network Connectors: [unique namespace]-global-connector
- Network Connectors: [unique namespace]-snat-connector

Then click on "Save and Exit"

Exercise 2: Add Fleet to Site
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Under the System namespace "Sites" -> "Site List" click on your site that
you previously created and click on the "..." on the far right (you may need
to scroll right) and then "edit".

.. image:: edit-site.png

Start to type "fleet" and click on "ves.io/fleet" then select the site 
that you previously created.  

.. image:: type-fleet.png

.. image:: select-site.png

Click on "Save Changes".
