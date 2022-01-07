Volterra AWS VPC Site
=====================

In additional to using the Volterra WAF from an F5 Regional Edge / PoP location
you can also deploy a "VoltMesh" node that enables you to access networks that
are not directly connected to the Internet and/or enforce WAF policies locally 
within the local network.

When we deploy VoltMesh outside of a Regional Edge we refer to these locations as
"Customer Edges".  In the following exercise we will review what the process is to
deploy a Customer Edge.  In our existing lab environment we have already deployed 
a shared Volterra AWS VPC Site.

Exercise 1: Introduction to Volterra AWS VPC Site
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#. Start in VoltConsole and find the "AWS VPC Sites" menu item. 

   From the top left "Select service" and look under "All Services"->"Cloud and Edge Sites"

   Click on "AWS VPC Sites"

#. Find the "student-aws" site

   In this lab environment we have already deployed a shared AWS VPC Site that we will 
   use in this lab.  Click on the "student-aws"

   You will be able to observe several metrics about the health of the site.

   In this deployment a VoltMesh node has been deployed into an existing VPC in our
   shared AWS lab environment.

#. Browse back to "AWS VPC Sites"
#. Click on "Add AWS VPC Site"
   This dialog can be used by a Network/Cloud Engineer to deploy a VoltMesh node into 
   AWS.  The process is fully automated and there are similar dialogs for automating 
   deployments into Azure and Google as well.  

   VoltMesh nodes can also be deployed into VMWare and KVM environments as well through
   a site registration process. 

Exercise 2 (Optional): F5 Volterra Simulator
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

During this lab we will not deploy a new AWS VPC Site.  If you would like to learn 
more about deploying an AWS VPC Site via Volterra you may want to try using the 
following F5 Volterra Simulator:

-https://simulator.f5.com/s/cloud2cloud_via_sites_brownfield

