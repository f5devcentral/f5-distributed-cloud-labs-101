Create WAF Policy
=================

Volterra WAF shares the same WAF engine that is used by F5 BIG-IP WAF and F5 NGINX App.

The Volterra WAF engine provides preset categories of rules to protect your web 
applications, provides the ability to run in a monitor or blocking mode, prevent 
false positives by excluding individual rules, IP addresses, or web application paths

In the next exercise you will configure a basic WAF policy 

Exercise 1: Create WAF Policy
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

We will create a blocking WAF policy.

#. Start in VoltConsole and switch to the Application context. 

    |app-context|

#. Navigate the menu to go to "Security"->"App Firewall". Click on *Add App Firewall*.
 
    |op-add-pool|

#. Enter the following variables:

    ================================= ============================================
    Variable                          Value
    ================================= ============================================
    Name                              blocking-app-firewall
    Enforcement Mode                  Blocking
    ================================= ============================================

    In this mode we have change the policy to block attacks that are included in 
    the default policy.  Later we will look at how we can customize these settings.

#. Click the *Save and Exit* button to create the policy