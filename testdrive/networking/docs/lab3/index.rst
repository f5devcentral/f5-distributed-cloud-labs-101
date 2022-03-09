Lab 2: Create Load Balancer Resources
=====================================

During this lab you will use VoltConsole to

- Create Load Balancer Resources

Start by logging into VoltConsole.  You should have previously received an email to create an account.

https://f5-sales-public.console.ves.volterra.io/

The following video will also review the process: https://youtu.be/onKw3aKSdIA

In the "Live" lab environment there is an existing "on-prem" site "student-udf" and "cloud" site "student-awsnet".

This next lab will create a Distributed Cloud Load Balancer resource that will enable
you to access both sites from a local Virtual IP.

- Use "F5 Simulator" to experience how to deploy a Distributed Cloud AWS Site via the Distributed Cloud Console
- Create HTTP LB with delegated domain to an existing "Public" resource in the shared AWS lab environment
- Update HTTP LB to point to an existing "Private" source in the shared AWS lab environment
- Create TCP LB with domain studentXXX.example.internal on port 8443 to 10.1.20.5 on UDF site

.. toctree::
   :maxdepth: 1
   :caption: Contents:

   shared-lab-env
   httplb
   tcplb





