Virtual Network
===============

The first network configuration task is to define a Virtual Network.  This 
will define how sites will connect to each other and whether they will
advertise network routes between sites or rely on source address translation.

Exercise 1: Examine Global Network Client
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Before we create a Virtual Network login to the "Global Network Client" in UDF
via web shell or ssh.  

Run ``netstat -rn`` to observe the route table.

.. code-block:: shell
    
    ubuntu@ubuntu:~$ netstat -rn
    Kernel IP routing table
    Destination     Gateway         Genmask         Flags   MSS Window  irtt Iface
    0.0.0.0         10.1.20.6       0.0.0.0         UG        0 0          0 ens6
    10.1.1.0        0.0.0.0         255.255.255.0   U         0 0          0 ens5
    10.1.20.0       0.0.0.0         255.255.255.0   U         0 0          0 ens6
    172.17.0.0      0.0.0.0         255.255.0.0     U         0 0          0 docker0

Observe that this device is pointing to the Volterra Gateway Site Local Inside (sli) 
interface (10.1.20.6).

Next run ``systemd-resolve --status`` and see that the Volterra Gateway is also 
configured as the only DNS resolver for this host.

.. code-block:: shell
    
    $ systemd-resolve --status
    ...
    Link 3 (ens6)
          Current Scopes: DNS
    ...
             DNS Servers: 10.1.20.6
    ...
   
Try to resolve a DNS name and access an external service.

.. code-block:: shell
    
    ubuntu@ubuntu:~$ ping -w 3 8.8.8.8
    PING 8.8.8.8 (8.8.8.8) 56(84) bytes of data.

    --- 8.8.8.8 ping statistics ---
    3 packets transmitted, 0 received, 100% packet loss, time 2051ms

    ubuntu@ubuntu:~$ curl -m 3 www.f5.com
    curl: (28) Resolving timed out after 3514 milliseconds

Exercise 2: Create Virtual Network
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