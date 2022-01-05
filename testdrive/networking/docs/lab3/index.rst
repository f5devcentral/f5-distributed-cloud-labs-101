Lab 2: Create Load Balancer Resources
=====================================

During this lab you will use VoltConsole to

- Create Load Balancer Resources

Start by logging into VoltConsole.  You should have previously received an email to create an account.

https://f5-sales-public.console.ves.volterra.io/

The following video will also review the process: https://youtu.be/onKw3aKSdIA

In the "Live" lab environment there is an existing "on-prem" site "student-udf" and "cloud" site "student-awsnet".

This next lab will create a Volterra Load Balancer resource that will enable
you to access both sites from a local Virtual IP.

- Create TCP LB with domain studentXX.backend.example.local on port 8443 to 10.1.20.5 on UDF site
- Create HTTP LB with delegated domain to IP of workload host in AWS on port 8080

.. toctree::
   :maxdepth: 1
   :caption: Contents:

   shared-lab-env
   httplb
   tcplb





