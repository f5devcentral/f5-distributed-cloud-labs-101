F5 Distributed Cloud Networking 101
===================================

This Lab environment highlights some of the basic concepts of Distributed Cloud Mesh.

The first part of the Lab will make use of F5 Distributed Cloud Simulators to emulate the process
of setting up two different sites (one in AWS, one in Azure).

We will then transition to using a "live" lab environment where you can experience using 
Distributed Cloud to setup 2 different deployment topologies and learn how Distributed Cloud can discover 
where your applications live.

During the lab you will be emulating a customer that needs to extend an
existing on-prem internal application to a Public Cloud environment.
The goal is to securely extend the application into the cloud environment
and have it highly available in both on-prem/cloud simultaneously.

Narrative
~~~~~~~~~

In this example we are starting with an "on-prem" Data Center.

.. image:: on-prem.png

The "frontend" application has a requirement that it must be able to 
communicate with the "backend".  The "backend" could be a database, legacy system, etc.

The goal is to extend the environment into AWS and still allow the "frontend" to
connect to the backend.  The following topology is deployed where Distributed Cloud Mesh is deployed
in both the on-prem and AWS environment.

.. image:: lab-topology.png

Once you have deployed the AWS environment and deployed two Distributed Cloud Mesh sites you will utilize
a Distributed Cloud TCP Load Balancer to privately connect from AWS to on-prem and a HTTP Load Balancer 
to connect publicly from a Regional Edge (AnyCast IP) to the frontend in AWS.

.. image:: lab-flow.png

Lab Environment
~~~~~~~~~~~~~~~

The on-prem environment is emulated by using a UDF environment that contains NGINX
resources.

The cloud environment is emulated by using a UDF Cloud Account in AWS that contains
NGINX resources.

.. toctree::
   :maxdepth: 1
   :caption: Contents:

   lab1/index
   lab3/index

