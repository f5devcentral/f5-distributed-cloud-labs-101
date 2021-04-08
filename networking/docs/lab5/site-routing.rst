Site Routing
============

The "Global Network Client" in your UDF environment is configured to use the 
Volterra Gateway as its default gateway.

Login to the "Global Network Client" via web shell or ssh.

Exercise 1: Connect to AWS workload
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Try to connect to the AWS workload VM.  Use the IP address that is output from the 
"workload" terraform.  If you forgot the IP you can run ``terraform output`` in the 
"workload" directory.

.. code-block::

    ubuntu@ubuntu:~$ curl 10.0.3.XX:8080/txt 
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

Exercise 2: Connect back to UDF from AWS
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

You should also be able to run ``ssh ubuntu@10.0.3.xx`` from the "Global Network Client" host 
in UDF (the ssh key is installed on the Client already).

Once on that host you should be able to connect to ``http://10.1.20.5/txt`` (the Global Network Client in UDF)

.. code-block::
   
   ================================================
    ___ ___   ___                    _
   | __| __| |   \ ___ _ __  ___    /_\  _ __ _ __
   | _||__ \ | |) / -_) '  \/ _ \  / _ \| '_ \ '_ \
   |_| |___/ |___/\___|_|_|_\___/ /_/ \_\ .__/ .__/
                                         |_|  |_|
   ================================================

         Node Name: UDF Environment (demo app)
        Short Name: ubuntu

         Server IP: 10.1.20.5
       Server Port: 80

         Client IP: 10.0.3.xx
       Client Port: 32860

   Client Protocol: HTTP
    Request Method: GET
       Request URI: /txt

       host_header: 10.1.20.5
        user-agent: curl/7.58.0

Exercise 3: Connect to the Internet
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

You should also be able to access the internet from this host and see
the connections logged in the "Flow Table" when viewing your site dashboard.