Site Creation and Registration
===============================
The first step to helping DemoBrews build a modern and flexible architecture to distribute the app
is creating Volterra sites in locations where they host infrastructure. This will include their on-prem
data center (your UDF deployment) and an AWS site hosted in the UDF cloud credentials account. 

.. note:: 
   
   To help avoid long waits during the lab, please complete the following steps first since they will take 10-15 minutes.

Section Goals
-------------
The customer's application is only available through their on-prem data center.
We need to create a Volterra site in the on-prem data center in order to expose the application
to the Volterra Global Network. In addition, we will create a VoltStack site in AWS for future application growth.

In this section we will configure the following components:

- 1 x VoltMesh based site in UDF
- 1 x AWS VPC 
- 1 x Network Policy 
- 1 x VoltStack based site in AWS

Terminology
-----------
VPC
   A Virtual Private Cloud (VPC) in an AWS resource that contains a logically isolated virtual network.
   Associated objects include subnets, security groups, route tables, EC2 instances, or other forms of compute resources.
    
Volterra Site
   A Volterra Site is a physical or cloud location where Volterra Nodes are deployed.
   A Site is made up of a cluster of one or more Volterra Nodes running VoltStack, VoltMesh, or related services.

VoltMesh
   VoltMesh is Volterra software used to connect, secure, control and observe applications deployed within a single
   Volterra Site or applications distributed across multiple customer sites and edge sites.

VoltStack
   VoltStack is a SaaS-based offering to deploy, secure, and operate a fleet of applications across a distributed infrastructure.
   Using a distributed control plane running in the Volterra global infrastructure, VoltStack delivers a logically centralized cloud that can be managed using industry-standard Kubernetes APIs.

.. toctree::
   :maxdepth: 1
   :caption: Contents:

   voltconsole
   voltAwsSite
   delegatedDomains