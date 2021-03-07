VoltConsole
===========

VoltConsole is a SaaS control-plane for Volterra services that provides a UI and API for managing network, security, and compute services.

VoltConsole can manage "sites" in existing on-premises data centers and sites in AWS, Azure, and GCP cloud environments.

Using VoltConsole, an end-user can centrally manage a distributed application environment.

Terminology
~~~~~~~~~~~~~

Namespace
    Namespace is a term that is commonly used in Kubernetes.  It can be thought of as a grouping of resources.

Exercise 1: Find your Namespace
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#. Please log into your assigned Volterra tenant. 

    .. note:: Each Volterra tenant has a unique login URL.  
        If you are unsure which tenant you belong to, please post a question in the lab chat. 

#. Once you log in, you will need to identify your namespace.  

    .. note:: It will usually be comprised of part of your name.  For example,
        if you have the last name of "Chen," you can find a namespace of
        "eric-chen."  Please note this name and use it in later steps to make it easier for others to distinguish between resources in shared namespaces.

    .. image:: ../_static/find-namespace.png

Exercise 2: Create a Site Token
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#. Next change to the "System" namespace.

    .. image:: ../_static/system-namespace.png

#. Once in the "System" namespace go to the "Site Management" menu and click on "Site Tokens".

    .. image:: ../_static/site-tokens-menu.png

#. Click on "Add Site Token".

    .. image:: ../_static/add-site-token-button.png

#. Provide a name for the token.  

    You can use the same unique name that was assigned for your namespace (i.e. first initial-lastname).

#. Record the "UID" that is created.  You will later use this when you add a site.

Exercise 3: Add a Site
~~~~~~~~~~~~~~~~~~~~~~

#. From your UDF Deployment find your "volterra" component and click on "Site UI".

    .. image:: ../_static/udf-site-ui.png

  .. note:: 
    
    **If you are unable to access the "Site UI" (blank page).  Please use the following workaround.**

    From your UDF Deployment find your "Client" component and click on "web shell" (you can also 
    use ssh if you have set up an SSH key previously).

    From the web shell run the following two commands

    .. code-block:: shell
      
      $ tmux
      $ ssh admin@10.1.1.6

    When prompted, use the following values from "Change Password".  To configure the site type "configure" and follow
    the prompts with the values below from "Configure Now".

#. Change Password

    #. The local Volterra Node UI will prompt you to login:

        =================== =====
        Variable            Value
        =================== =====
        Username            admin
        Password            Volterra123
        =================== =====
    
    #. Change the default password 

#. Click on "Configure Now".

    .. image:: ../_static/site-ui-configure-now.png

#. Enter the following information.

    =================== =====
    Variable            Value
    =================== =====
    Token               [use one created previously]
    Cluster Name        [unique name]+udf
    Hostname            main-0
    Certified Hardware  kvm-voltmesh
    Primary Outside NIC eth0
    Latitude/Longitude      
    =================== =====

#. Click on "Save Configuration". 

#. Go back to VoltConsole to "Accept" the registration.

#. Go to "System->Site Management->Registrations".

    .. image:: ../_static/registrations-menu.png

#. Click on the "checkmark" icon to accept the registration.

    .. image:: ../_static/registrations-accept.png

#. Click on "Accept" to use the default values (we will modify these in a later lab).

  .. warning:: 
        
        Latitude / Longitude are required values.  Make sure they are not set to 0

        One method of finding a location is to search Google Maps, right click and 
        highlight the GPS coordinates.  This will copy the values into your clipboard.
        |geolocation|

        Pick a location that is geographically similar to where you selected your UDF
        deployment (i.e. for Virginia, USA search for Washington Monument, DC)

This will start the process of loading the Volterra software that is 
necessary to connect the site to a Volterra Regional Edge site.

    .. note:: It will take several minutes for this to complete.  You can continue to the next step while you wait for it to complete.

.. |geolocation| image:: ../_static/geolocation.png
