Network Connector
=================

When you add a site to a Virtual Network you need to define whether the site
will use Source Address Translation (SNAT) to send traffic from the site.

A Network Connector defines whether SNAT is enabled or not.  If SNAT is not 
enabled you can specify which interface network to "share" with other sites.

This makes it possible to define hub/spoke network topologies with support for
an environment where it is not always possible to support non-overlapping IP
networks.

Exercise 1: Create a Network Connector
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This Network Connector will enable the Site Local Inside network (10.1.20.0/24)
to be accessible to other sites that are also participating in the same Global Network.

Go to "System" namespace "Site Management" -> "Networks" -> "Network Connector".

Click on "Add Network Connector" and fill in the following.

- Name: [unique namespace]-global-connector
- Select Network Connector Type: Direct, Site Local Inside to a Global Network
- Global Virtual Network: system/[unique namespace]-global

Then click on "Continue"

Exercise 2: Create a SNAT Network Connector
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This Network Connector will be used to bridge traffic from Site Local Inside 
to Site Local Outside (allow outbound internet).

Go to "System" namespace "Site Management" -> "Networks" -> "Network Connector".

Click on "Add Network Connector" and fill in the following.

- Name: [unique namespace]-snat-connector
- Select Network Connector Type: SNAT, Site Local Inside to Site Local Outside (default)
- Routing Mode: Default Gateway (default)
- SNAT Source IP Selection: Interface IP (default)

Then click on "Continue"