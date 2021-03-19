.. _sitecli:

Add a Site (via CLI)
~~~~~~~~~~~~~~~~~~~~

The following will use the CLI to configure your site.  You can also
use the UI to configure a site.

#. From your UDF Deployment find your "Client" component and click on "Web Shell".

    From the web shell run the following two commands

    .. code-block:: shell
      
      $ tmux
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
