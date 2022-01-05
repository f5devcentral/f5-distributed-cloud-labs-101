AWS Routing
===========

When you deploy an AWS Site it will automatically configure the "Internal" 
subnet to use the Volterra Gateway as its default gateway.

As an optional exercise you can verify this in the AWS Console by looking 
at the Route Table associated with the Internal Subnet.

.. image:: aws-route-table.png

Modify AWS Site Network Config
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

We need to connect the AWS site to the "Global Network" that we previously 
created.  By default it will SNAT all traffic that originates from the AWS
site.

Under the System namespace go to Manage -> Site Management -> AWS VPC Sites 

Scroll to the right of your AWS site and click on the three dots "..." to 
select "Edit"

Under "Networking Config" click on "Configure" 
next to (Ingress/Egress Gateway (2 interfaces))

This will open a new sub menu.

Next to "Advanced Options" click on "Show Advanced Fields"

Change "Select Global Networks to Connect" to "Connect Global Networks".

Then click on "Configure" under "Global Network Connections"

* Select Network Connection Type: Direct, Site Local Inside to a Global Network
* Global Virtual Network: system/[unique name]-global
* Click on Apply
* Select "Manage Static Routes" for "Managed Static Routes for Inside Network"
    * Select "Simple Static Route" (default)
    * Simple Static Route: 10.0.3.0/24

Click on Apply and save your changes.

Verify Routes
~~~~~~~~~~~~~

You can verify that the routes have been applied by using the "Tools" that is part of
your site in VoltConsole.  

When viewing your site click on "Tools" (far right, you may need to scroll).

Select the tool "Show Routes".

For "Virtual Network Type" specify "VIRTUAL_NETWORK_SITE_LOCAL_INSIDE".

Click on "Show routes".

You should get JSON ouput.  In particular look for an entry for 10.1.20.0/24.  
The entry for 10.1.20.6/32 is for the Volterra Gateway in UDF.

.. code-block:: javascript
    
    ...
        {
            "prefix": "10.1.20.0/24",
            "nh": 91,
            "flags": "",
            "label": 263,
            "nh_info": "Mpls Tunnel to 10.101.82.12, encapsulation type MPLSoUDP"
        },
        {
            "prefix": "10.1.20.6/32",
            "nh": 91,
            "flags": "",
            "label": 263,
            "nh_info": "Mpls Tunnel to 10.101.82.12, encapsulation type MPLSoUDP"
        },
    ...