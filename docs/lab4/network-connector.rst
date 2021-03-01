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

Go to "System" namespace "Site Management" -> "Networks" -> "Network Connector".

Click on "Add Network Connector" and fill in the following.

- Name: [unique namespace]-global-connector
- Select Network Connector Type: Direct, Site Local Outside to a Global Network
- Global Virtual Network: system/[unique namespace]-global

Then click on "Continue"