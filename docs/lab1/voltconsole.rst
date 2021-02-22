VoltConsole
===========

VoltConsole is a SaaS control-plane for Volterra services that provides a UI and API for managing network, security, and compute services.

It can be used to manage "sites" in existing on-premises data centers as well as manage sites in AWS, Azure, and GCP cloud environments.

Using VoltConsole an end-user can centrally manage a distributed application environment.

Exercise 1: Find your Namespace
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

You should have already been granted access to a Volterra tenant.

After you login you will need to identify the namespace that has been 
allocated to you.  It will usually comprise as part of your name.  For example
if you have the last name of "chen" you can find that there is a namespace of
"eric-chen".  Take note of this name and use it in later steps to make it 
easier for others to distinguish between resources in shared namespaces.

.. image:: find-namespace.png

.. note:: Namespace is a term that is commonly used in Kubernetes.  It can be thought of as a grouping of resources.

Exercise 2: Create a Site Token
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Next you will need to change to the "System" namespace.

.. image:: system-namespace.png

Once in the "System" namespace you will need to go to the "Site Management"
menu and select "Site Tokens".

.. image:: site-tokens-menu.png

Click on "Add Site Token".

.. image:: add-site-token-button.png

Provide a name for the token.  You can use the same unique name that was 
assigned for your namespace (i.e. first initial-lastname).

Record the "UID" that is created.  You will later use this when you add a site.



