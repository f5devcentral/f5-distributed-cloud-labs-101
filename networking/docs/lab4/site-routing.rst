Site Routing
============

In your UDF site you need to manually configure routing.  Since we are unable
to modify the overall route table in UDF we will use a static route on the 
Ubuntu Client to emulate making a network change.  This could also be done with
dynamic routing protocols like BGP in environments that support those protocols.

Static Route
~~~~~~~~~~~~

On your Ubuntu Client first start by trying to connect to the workload instance 
that you previously created.

.. code-block:: shell
  
  ubuntu@ubuntu:~$ curl 10.0.3.XX:8080/txt -m 3
  curl: (28) Connection timed out after 3001 milliseconds

Next create a static route to the Volterra Gateway in your UDF site.

.. code-block:: shell
  
  ubuntu@ubuntu:~$ sudo ip route add 10.0.0.0/16 via 10.1.1.6

Repeat the previous test.

.. code-block::

    ubuntu@ubuntu:~$ curl 10.0.3.XX:8080/txt -m 3
    ================================================
    ___ ___   ___                    _
    | __| __| |   \ ___ _ __  ___    /_\  _ __ _ __
    | _||__ \ | |) / -_) '  \/ _ \  / _ \| '_ \ '_ \
    |_| |___/ |___/\___|_|_|_\___/ /_/ \_\ .__/ .__/
                                        |_|  |_|
    ================================================

        Node Name: AWS Environment
        Short Name: ip-10-0-3-14

        Server IP: 10.0.3.XX
        Server Port: 8080

        Client IP: 10.1.1.4
        Client Port: 49686

    Client Protocol: HTTP
    Request Method: GET
        Request URI: /txt

        host_header: 10.0.3.XX
        user-agent: curl/7.58.0