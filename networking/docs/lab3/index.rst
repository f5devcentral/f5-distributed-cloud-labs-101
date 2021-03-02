Lab 3: Create Load Balancer Resources
=====================================

During this lab you will use VoltConsole to

- Create Load Balancer Resources
  
During the previous lab you created an "on-prem" (UDF) and "cloud" (AWS) site.

This next lab will create a Volterra Load Balancer resource that will enable
you to access both sites from a local Virtual IP.

- Create TCP LB with domain backend.example.local on port 8443 to 10.1.1.4 on UDF site
- Deploy workload instance via terraform
- Create HTTP LB with delegated domain to IP of workload host in AWS on port 8080

.. toctree::
   :maxdepth: 1
   :caption: Contents:

   tcplb
   workload
   httplb



