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

    .. note:: It will usually be the user-part of your F5 email address with the period replaced with a hyphen.  For example,
        if your F5 email address is eric.chen @ f5.com  you can find a namespace of
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

Exercise 3: Retrieve latitude/longitude
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Volterra uses the latitude/longitude of a site to assist in finding the closest
geographic Regional Edge locations.  The following is meant to help you find
a location that is close to the UDF deployment location that you selected.

One method of finding a location is to search Google Maps, right click and 
highlight the GPS coordinates.  This will copy the values into your clipboard.
|geolocation|

Pick a location that is geographically similar to where you selected your UDF
deployment (i.e. for Virginia, USA search for Washington Monument, DC)

You could also use a regional office (vs. your home address) as a location
https://www.f5.com/company/contact/regional-offices

Once you have a reasonable set of latitude/longitude you can proceed.

Exercise 4a: Add a Site (via CLI)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The following will use the CLI to configure your site.  You can also
use the UI to configure a site, but at the time that this was published
there is a known issue with using the Site UI and CLI is the workaround.


#. From your UDF Deployment find your "Client" component and click on "Web Shell".

    From the web shell run the following two commands

    .. code-block:: shell
      
      $ ssh admin@10.1.1.6

    When prompted, use the following values from "Change Password".  

#. Change Password

    #. The local Volterra Node UI will prompt you to login:

        =================== =====
        Variable            Value
        =================== =====
        Username            admin
        Password            Volterra123
        =================== =====
    
    #. Change the default password 

        The result should look like the following.

        .. code-block::
            
            ubuntu@ubuntu:~$ ssh admin@10.1.1.6

            UNAUTHORIZED ACCESS TO THIS DEVICE IS PROHIBITED
            All actions performed on this device are audited
            admin@10.1.1.6's password: 

            ...
                                                                                                                                                            
            WELCOME IN VOLTERRA NODE LOGIN SHELL
            This allows to:
            - configure Volterra Node registration information
            - factory reset Volterra Node
            - collect debug information for support
            Use TAB to select various options.
            You must change password during first login:
            ? Please type your current password ***********
            ? Please type your new password *****
            ? Please retype your new password *****

#. Configure the site from the command line: 
    Type "configure" and follow the prompts. Customize the example values below with your details.  
    After completion, skip to the "Accept Registration" exercise below.

    =================== =====
    CLI Variable        Value
    =================== =====
    token               56b6a47f-5ec8-47ea-baf4-xxxxxxx
    site name           [u_name]-udf
    hostname            main-0
    latitude            [your latitude, example: 47.6]
    longitude           [your longitude, example: -122.3]
    default fleet name  [optional]
    certified hardware  kvm-voltmesh
    primary outside NIC eth0
    =================== =====

    The output should look similar to the following.

    .. code-block::
        
        >>> configure
        ? What is your token? 56b6a47f-5ec8-47ea-baf4-xxxxxxx
        ? What is your site name? [optional] [unique name]-udf
        ? What is your hostname? [optional] main-0
        ? What is your latitude? [optional] 47.6
        ? What is your longitude? [optional] -122.3
        ? What is your default fleet name? [optional] 
        ? Select certified hardware: kvm-voltmesh
        ? Select primary outside NIC: eth0

#. Type 'y' + 'enter' when prompted

   .. code-block::
    
    certifiedHardware: kvm-voltmesh
    clusterName: [unique name]-udf
    hostname: main-0
    latitude: 47.6
    longitude: -122.3
    primaryOutsideNic: eth0
    token: 56b6a47f-5ec8-47ea-baf4-xxxxxxx
    ? Confirm configuration? (y/N) 

Exercise 4b: Configure Site using CLI
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

If you used the CLI to configure your site you can skip to Exercise 4: Accept Registration.

#. From your UDF Deployment find your "volterra" component and click on "Site UI".

    .. image:: ../_static/udf-site-ui.png  

#. Change Password

    #. The local Volterra Node UI will prompt you to login:

        =================== =====
        Variable            Value
        =================== =====
        Username            admin
        Password            Volterra123
        =================== =====
    
    #. Change the default password 

#. If you are using the GUI, click on "Configure Now".

    .. image:: ../_static/site-ui-configure-now.png

#. Enter the following information.

    =================== =====
    Variable            Value
    =================== =====
    Token               [use one created previously]
    Cluster Name        [unique name]_udf
    Hostname            main-0
    Certified Hardware  kvm-voltmesh
    Primary Outside NIC eth0
    Latitude/Longitude      
    =================== =====

#. Click on "Save Configuration". 



Exercise 5: Accept Registration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#. Go back to VoltConsole to "Accept" the registration.

#. Go to "System->Site Management->Registrations".

    .. image:: ../_static/registrations-menu.png

#. Click on the "checkmark" icon to accept the registration.

    .. image:: ../_static/registrations-accept.png

#. Click on "Accept" to use the default values (we will modify these in a later lab).

This will start the process of loading the Volterra software that is 
necessary to connect the site to a Volterra Regional Edge site.

    .. note:: It will take several minutes for this to complete.  You can continue to the next step while you wait for it to complete.

.. |geolocation| image:: ../_static/geolocation.png
