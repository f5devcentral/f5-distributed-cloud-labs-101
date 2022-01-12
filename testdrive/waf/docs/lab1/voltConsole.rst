Logging into VoltConsole
========================

You should have received an email with an invitation to access VoltConsole.

The name of the tenant that we will be using is ``f5-sales-public``

Exercise #1: Login to VoltConsole
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

You will need to create a password that will be associated with your email address.

If you have NOT received an email from our system you may need to provide an alternate
email address that we can use for the purposes of this lab.

The following is a video that covers the steps involved.

.. raw:: html
  
  <iframe width="560" height="315" src="https://www.youtube.com/embed/onKw3aKSdIA" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


**VoltConsole**

VoltConsole is a SaaS control-plane for Volterra services that provides a UI and API for managing network, security, and compute services.

VoltConsole can manage "sites" in existing on-prem data centers and sites in AWS, Azure, and GCP cloud environments.

Using VoltConsole, an end-user can centrally manage a distributed application environment.

Terminology
~~~~~~~~~~~~~

Namespace
    Namespace is a term that is commonly used in Kubernetes.  It can be thought of as a grouping of resources.

Exercise 2: Find your Namespace
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#. Please log into your assigned Volterra tenant. https://f5-sales-public.console.ves.volterra.io/

    .. note:: The VoltConsole GUI has a relatively short timeout. This is not configurable. We have an enhancement request to allow this to be configured.

#. Once you log in, you will need to identify your namespace.  

  You should only see one namespace named ``studentXXX``.

  Throughout the lab you should use your assigned student number when prompted to create resources

    .. image:: ../_static/find-namespace.png  