Lab 1: Volterra Application Firewall Deployment
===============================================

The purpose of this lab is to extend the participant's ability to navigate the 
Volterra console and assign an Application Firewall via Rule-based WAF configurations. 
This an entry-level security configuration which is part of Volterra's current multi-layer 
security approach.   

Volterra's current multi-layer security approach leverages both a **Rule-Based WAF** and a 
**Behavioral Firewall**. This can be further extended through using a combination of 
the Rules-Based WAF, Behavioral Analysis (Behavioral Firewall), and **Fast ACLs** from the
Network Firewall section to enable **Application DOS Protection**. These additional topics
will be addressed in specific labs.  

Objective:
----------

-  Gain a navigational understanding of Volterra Console and its key menus

-  Gain an initial understanding of Volterra's Application Firewall - Rule-Based WAF configuration

-  Deploy and verify security configurations within the Volterra Console 

Lab Requirements:
-----------------

-  All Lab requirements will be noted in the tasks that follow

-  Estimated completion time: 25 minutes

Lab 1 Tasks:
------------

TASK 1: Quick Intro - Rules-Based WAFs (Concept Review)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
The rules engine (currently based on ModSec) is the centerpiece of Volterra's WAFs current approach
to application security and the decision of what rules to configure presumes a high degree of
knowledge of the rules. If for some reason, a needed rule is excluded then the application
will be vulnerable. If unwanted rules are added, then it adds extra processing per request 
and this adds latency. To solve this problem of rules knowledge and make it extremely easy
to configure, we created a rules processing engine that automates the inclusion and exclusion
of rules.

There are two types of rules for each WAF-object that are supported by the system 
**core-rule-set** and a **volterra-rule-set**. There are two ways the rules can be enabled:

:**Implicit**: User provides a list of technologies. For example, programming languages used,
               content management systems used, types of servers, etc. that are used by the 
               endpoints (or services) for a given virtual-host. Volterra has an algorithmic 
               engine that will use this information to automatically figure out rules to 
               include and exclude from both the rule set.
			  
:**Explicit**: User can explicitly configure rules to exclude from the Rule engine.

In addition to configuring the rules, the decision needs to be made on whether to block the 
attacks or just generate an alert and let the security or application experts decide what
actions to take:

:**Monitoring mode**: This will generate an alert based on a security event. No attack is 
                      blocked in this mode.
:**Blocking Mode**: This will configure the WAF to be in Inline-mode and deny client requests 
                    that match certain rules.

TASK 2: Quick Intro - Configuring Rules-based WAFs (Concept Review)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
The user can configure a **Web Application Firewall** per **virtual host** by attaching **WAF**
**object** or **WAF-Rules object** to a **virtual-host** object:

:**WAF object**: Is a mechanism to make users life easy and is described earlier as 
                 the implicit mode. The idea is that instead of enabling all the rules 
                 or typing individual rules, the user can just define the type of 
                 technologies used by their applications and types of attacks that need 
                 to be detected and the system will decide what needs to be done.

:**WAF-Rules object**: Is a mechanism for advanced users and is described earlier as the explicit 
                       mode. One can select rules in core-rule-set or volterra-rule-set to be 
                       enabled/disabled by configuring the WAF-rules-object appropriately. 

The built-in rules processor takes the WAF object and automatically creates a WAF-rules object that 
contains the detailed configuration information that can be used by the WAF. The processing engine
works on the basis of the following information:

:**Application Profile**: Defines the technologies used to build the app - Programming languages used,
                          content management systems used, types of servers, etc.
:**Types of Attacks to Detect**: Defines the types of attacks that need to be detected and prevented
                                 (SQL injection, XSS, Protocol, etc.)

Automatically generated WAF-rules object cannot be modified by users and this object is owned by the 
system. However, the user can always copy this auto-generated WAF-rules object and further tune it.

Individual WAF or WAF-Rules objects can be shared by multiple virtual hosts within a namespace. In 
addition, these objects can also be attached to virtual host or per route basis. Since WAF objects 
can be shared with multiple virtual hosts and multiple WAFs can be configured to given virtual-host by 
way of routes, monitoring is not based on these WAF objects. All monitoring for a WAF is done on a per 
virtual-host basis to provide insights into application.

Details on all the parameters and how they can be configured for this object is covered in the API 
Specification under WAF object or WAF-Rules object documentation on https://www.volterra.io 

TASK 3: Volterra Console (General Navigation)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+----------------------------------------------------------------------------------------------+
| 1. Login to the Volterra Console: **https://www.volterra.io** and complete authentication.   |
|                                                                                              |
| 2. **Log In** > **I'm a member of a team account** <Enter your Volterra Tenant ID>           |
|    then click **Next**.                                                                      |
|                                                                                              |
| 3. **Sign in with Azure** (Participants must have completed the account onboarding process.) |
|                                                                                              |
| *Note: Participants must have their Volterra Tenant ID to complete login and lab.*           |
|                                                                                              |
| *Note: Logging on as Tenant Owner provides tenant-wide administration priviledges.*          |
|                                                                                              |
| **Volterra Tenants**                                                                         |
|                                                                                              |
| ================================= ===================                                        |
| Name                              Volterra Tenant ID                                         |
| ================================= ===================                                        |
| GSA                               f5-gsa                                                     |
| SA                                f5-sa                                                      |
| Americas Enterprise               f5-amer-ent                                                |
| Americas Service Provider         f5-amer-sp                                                 |
| EMEA Enterprise                   f5-emea-ent                                                |
| EMEA Service Provider             f5-emea-sp                                                 |
| APCJ Enterprise                   f5-apac-ent                                                |
| APCJ Service Provider             f5-apac-sp                                                 |
| ================================= ===================                                        |
|                                                                                              |
+----------------------------------------------------------------------------------------------+
| |image001|                                                                                   |
|                                                                                              |
| |image002|                                                                                   |
|                                                                                              |
| |image003|                                                                                   |
+----------------------------------------------------------------------------------------------+

+----------------------------------------------------------------------------------------------+
| 4. Review the **Volt Console** as presented. Your focused view maybe different.              |
|                                                                                              |
| 5. Click the **App** tab at the top of the left navigation. It is the **App View** and is    |
|    more centric to **DevOps** **Personas**.                                                  |
+----------------------------------------------------------------------------------------------+
| |image004|                                                                                   |
+----------------------------------------------------------------------------------------------+

+----------------------------------------------------------------------------------------------+
| 6. Click the **Shared** tab at the top of the left navigation. This is the **Shared View**   |
|    and is more centric to **SecOps Personas** and is where the bulk of all **shared**        |
|    application security configurations will be made.                                         |
+----------------------------------------------------------------------------------------------+
| |image005|                                                                                   |
+----------------------------------------------------------------------------------------------+

+----------------------------------------------------------------------------------------------+
| 7. Click the **System** tab at the top of the left navigation.  This is the **System View**  |
|    and is more centric to **NetOps Personas**.                                               |
+----------------------------------------------------------------------------------------------+
| |image006|                                                                                   |
+----------------------------------------------------------------------------------------------+

+----------------------------------------------------------------------------------------------+
| 8. This is the **General View** and is specific to Profile and Tenant operations.            |
+----------------------------------------------------------------------------------------------+
| |image007|                                                                                   |
+----------------------------------------------------------------------------------------------+

TASK 4: Before you begin the Lab  
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+----------------------------------------------------------------------------------------------+
| 1. For purposes of lab localization, participants need to identify their tenant's delegated  |
|    delegated Public DNS subdomain.                                                           |
|                                                                                              |
| 2. Click the **System** tab at the top of the left navigation. Navigate to **Manage** >      |
|    **Networking** > **Delegated Domains**.                                                   |
|                                                                                              |
| 3. In the updated right panel, locate the value of the domain that is under **.f5demos.com** |
|    Record the full delegated domain as it will be used later in the lab.                     |
|                                                                                              |
| *Note: The localized subdomain under .f5demos.com has been delegated to this Volterra*       |
| *tenant. This enables auto generation of Public DNS hostnames.*                              |
+----------------------------------------------------------------------------------------------+
| |image044|                                                                                   |
+----------------------------------------------------------------------------------------------+

TASK 5: Configuring Web Application Firewall
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+----------------------------------------------------------------------------------------------+
| 1. The following describes the configuration workflow for creating an application firewall   |
|    which fundamentally involves the following key steps:                                     |
|                                                                                              |
|    Choosing a preferred creation approach (one of the below):                                |
|                                                                                              |
|    * **Create WAF Rules**: Creating a WAF Rules object in this manner is a process of        |
|      *manual* selection of the rule ID/lists from the Core Rules Set (CRS) and Volterra      |
|      Rules Set (VRS).                                                                        |
|                                                                                              |
|    * **Create WAF**: Create application firewall object which *auto-generates* a WAF Rules   |
|      object based on selected or excluded criteria and the configured application settings.  |
|                                                                                              |
|    You will then perform the following next step:                                            |
|                                                                                              |
|    * **Attach WAF**: Attach the WAF Rules Object or WAF Object to the Virtual Host.          |
+----------------------------------------------------------------------------------------------+
| |image008|                                                                                   |
+----------------------------------------------------------------------------------------------+

+----------------------------------------------------------------------------------------------+
| 2. In the Volterra Console, select the **App** view top left and select your namespace from  |
|    the *namespace* dropdown.                                                                 |
|                                                                                              |
|    *Note: For shared configurations, the shared namespace is automatically selected when*    |
|    * using the Shared view. (for more global configurations).*                               |
+----------------------------------------------------------------------------------------------+
| |image009|                                                                                   |
+----------------------------------------------------------------------------------------------+

+----------------------------------------------------------------------------------------------+
| 3. Select **Security** > **App Firewall** from left navigation then select **App Firewalls** |
|    from the flyout menu.                                                                     |
|                                                                                              |
| 4. Click **Add Firewall** in the right-side, updated panel.                                  |
+----------------------------------------------------------------------------------------------+
| |image010|                                                                                   |
+----------------------------------------------------------------------------------------------+

+----------------------------------------------------------------------------------------------+
| 5. In the **New: Firewall** window, enter the following values in the **Metadata** and       |
|                                                                                              |
|    **Mode** sections respectively.                                                           |
|                                                                                              |
|    **Name**: Unique name (ex <username>-appfw)                                               |
|                                                                                              |
|    **Mode**: Block (as we will be blocking traffic) Note: Alert is the other option here.    |
|                                                                                              |
| 6. In the **Disabled Detections** section, click in the *Detections Tag* input field and in  |
|    resulting pop-up menu, select:                                                            |
|                                                                                              |
|    * **RCE Attack** (Remote Code Execution Attack)                                           |
|                                                                                              |
|    * **LFI Attack** (Local File Inclusion)                                                   |
|                                                                                              |
| 7. Click the **Save and Exit** button.                                                       |
+----------------------------------------------------------------------------------------------+
| |image011|                                                                                   |
+----------------------------------------------------------------------------------------------+

+----------------------------------------------------------------------------------------------+
| 8. Select **Security** > **App Firewall** from left navigation then select **App**           |
|    **Firewall Rules** from the flyout menu.                                                  |
+----------------------------------------------------------------------------------------------+
| |image012|                                                                                   |
+----------------------------------------------------------------------------------------------+

+----------------------------------------------------------------------------------------------+
| 9. Find the generated *App Firewall Rule* that matches the App Firewall created previously.  |
|    This will be in the format *generated-waf-<app firewall name>* from step 5 above.         |
|                                                                                              |
|    *Note: When creating the App Firewall first, a generated App Firewall Rule is*            |
|    *automatically created. It is also updated when editted.*                                 |
|                                                                                              |
| 10. Click the three dots **...** on the far right of the identified row.                     |
|                                                                                              |
| 11. Click **Edit** in the resulting pop-up window.                                           |
+----------------------------------------------------------------------------------------------+
| |image013|                                                                                   |
+----------------------------------------------------------------------------------------------+

+----------------------------------------------------------------------------------------------+
| 12. Review the generated **App Firewall Rule** and the various sections.                     |
|                                                                                              |
|     *Note: The Rule IDs section can be adjusted through the Disabled Detections option*      |
|     *in the WAF Object*                                                                      |
|                                                                                              |
| 13. Click the horizontal navigation's **JSON** tab to view the API ready, JSON format.       |
|                                                                                              |
| 14. Scroll to the bottom of **JSON** tab and click **Cancel and Exit**.                      |
+----------------------------------------------------------------------------------------------+
| |image014|                                                                                   |
|                                                                                              |
| |image015|                                                                                   |
|                                                                                              |
| |image016|                                                                                   |
|                                                                                              |
| |image017|                                                                                   |
+----------------------------------------------------------------------------------------------+

TASK: 6: Building a HTTP Load Balancer and Origin Pool
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+----------------------------------------------------------------------------------------------+
| 1. Remaining in the **App** view, select **Manage** > **Load Balancers** from left           |
|    navigation then select **HTTP Load Balancers** from the flyout menu.                      |
|                                                                                              |
| 2. Click **Add HTTP Load Balancer** in the right-side, updated panel.                        |
+----------------------------------------------------------------------------------------------+
| |image018|                                                                                   |
+----------------------------------------------------------------------------------------------+

+----------------------------------------------------------------------------------------------+
| 3. In the **New: HTTP Load Balancer** window, enter or select the following values:          |
|                                                                                              |
|    **Metadata** section:                                                                     |
|                                                                                              |
|    * **Name**: <username>-app                                                                |
|                                                                                              |
|    **Basic Configuration** section:                                                          |
|                                                                                              |
|    * **Domains**: <username>-app.<Delegated Domain> Recorded in Task 4, Step 3               |
|                                                                                              |
|    * **Select Type of Load Balancer**: HTTP                                                  |
|                                                                                              |
|      *Note: Volterra has been integrated with Let's Encrypt.  If the Automatic Certificate*  |
|      *option is selected, a certificate will be generated and maintained based on the*       |
|      *selected hostname. This should not be used in general labs to respect Let's Encrypt*   |
|      *cert creation rate-limiting https://letsencrypt.org/docs/rate-limits/*                 |
|                                                                                              |
|    * Check the option for **Automatically Manage DNS Records**.                              |
+----------------------------------------------------------------------------------------------+
| |image019|                                                                                   |
+----------------------------------------------------------------------------------------------+

+----------------------------------------------------------------------------------------------+
| 4. In the **Default Origin Servers** section click the **Configure** link.                   |
+----------------------------------------------------------------------------------------------+
| |image020|                                                                                   |
+----------------------------------------------------------------------------------------------+

+----------------------------------------------------------------------------------------------+
| 5. In the resulting **Origin Pools** window, click **Add Item**.                             |
+----------------------------------------------------------------------------------------------+
| |image021|                                                                                   |
+----------------------------------------------------------------------------------------------+

+----------------------------------------------------------------------------------------------+
| 6. In the updated **Origin Pools** window, click **Select Origin Pool** and from the         |
|    dropdown menu, **Create new origin pool**.                                                |
+----------------------------------------------------------------------------------------------+
| |image022|                                                                                   |
+----------------------------------------------------------------------------------------------+

+----------------------------------------------------------------------------------------------+
| 7. In the **New: Origin Pool** window, input the following values:                           |
|                                                                                              |
|    **Metadata** section:                                                                     |
|                                                                                              |
|    * **Name**: <username>-f5-com-pool                                                        |
|                                                                                              |
|    **Basic Configuration** section:                                                          |
|                                                                                              |
|    * **Select Type of Origin Server**: Public DNS of Origin Server                           |
|                                                                                              |
|    * **DNS Name**: www.f5.com                                                                |
+----------------------------------------------------------------------------------------------+
| |image023|                                                                                   |
+----------------------------------------------------------------------------------------------+

+----------------------------------------------------------------------------------------------+
| 8. Scroll to the **TLS Configuration** section and select **TLS** from the **Enable TLS**    |
|    **for Origin Server**.                                                                    |
|                                                                                              |
| 9. Scroll to the bottom and click the **Continue** button.                                   |
+----------------------------------------------------------------------------------------------+
| |image024|                                                                                   |
|                                                                                              |
| |image025|                                                                                   |
+----------------------------------------------------------------------------------------------+

+----------------------------------------------------------------------------------------------+
| 10. Review the Origin Pool configuration and click the **Apply** button.                     |
+----------------------------------------------------------------------------------------------+
| |image026|                                                                                   |
+----------------------------------------------------------------------------------------------+

TASK: 7: Attaching a WAF Configuration (WAF Object) & Completing HTTP Load Balancer
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+----------------------------------------------------------------------------------------------+
| 1. After returning to the **New: HTTP Load Balancer** window, scroll to the **Security**     |
|    **Configuration** section.                                                                |
|                                                                                              |
| 2. Select **Specify WAF Intent** from the **Select Web Application Firewall (WAF) Config**   |
|    dropdown menu.                                                                            |
|                                                                                              |
|    *Note: If you were editing rather than creating a HTTP Load Balancer, a WAF Object*       |
|    *could be attached in a similar manner.*                                                  |
|                                                                                              |
|    *Note: Alternatively, a more manually controlled WAF Rules Object could also be assigned.*|
+----------------------------------------------------------------------------------------------+
| |image027|                                                                                   |
+----------------------------------------------------------------------------------------------+

+----------------------------------------------------------------------------------------------+
| 3. Scroll to the bottom of **New: HTTP Load Balancer** window, and click the **Save and**    |
|    **Exit** button.                                                                          |
+----------------------------------------------------------------------------------------------+
| |image028|                                                                                   |
+----------------------------------------------------------------------------------------------+

+----------------------------------------------------------------------------------------------+
| 4. After creating the HTTP Load Balancer, the created HTTP Load Balancer will be displayed.  |
+----------------------------------------------------------------------------------------------+
| |image029|                                                                                   |
+----------------------------------------------------------------------------------------------+

TASK: 8: Testing and Adjusting WAF Configuration (WAF Object)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+----------------------------------------------------------------------------------------------+
| 1. In a new browser window, navigate to the hostname defined in Task 6, Step 3.  This        |
|    should be **http://<username>-app.<delegated domain>**. Confirm its successful.           |
|                                                                                              |
|    *Note: It make takes a few seconds for the deployment to be ready to test.*               |
+----------------------------------------------------------------------------------------------+
| |image030|                                                                                   |
+----------------------------------------------------------------------------------------------+

+----------------------------------------------------------------------------------------------+
| 2. Now append the following as your query string to your URL and browse again:               |
|                                                                                              |
|    **/?cmd=cat%20/etc/passwd**                                                               |
|                                                                                              |
| 3. What was your result? (AWAF Block Page, Nothing ???)                                      |
+----------------------------------------------------------------------------------------------+
| |image031|                                                                                   |
+----------------------------------------------------------------------------------------------+

+----------------------------------------------------------------------------------------------+
| 4. Let's now adjust the **WAF Object** by returning to the Volterra Console and selecting    |
|    **Security** > **App Firewalls**.                                                         |
|                                                                                              |
| 5. In the resulting **App Firewalls** list window, find the row of the App Firewall created  |
|    in Task 4, step 5 and navigating to the end of the row, clicking the three dots *...* and |
|    then clicking **Edit** in the pop-up window.                                              |
+----------------------------------------------------------------------------------------------+
| |image032|                                                                                   |
+----------------------------------------------------------------------------------------------+

+----------------------------------------------------------------------------------------------+
| 6. In the App Firewall Edit window, scroll to the **Disabled Detections** section.           |
|                                                                                              |
| 7. Clear the **RCE Attack** and **LFI Attack** in the **Detection Tag** input field by       |
|    clicking on the **x** next to each item.                                                  |
+----------------------------------------------------------------------------------------------+
| |image033|                                                                                   |
+----------------------------------------------------------------------------------------------+

+----------------------------------------------------------------------------------------------+
| 8. Once the **Detections Tag** input field is empty, click the **Save and Exit** button.     |
+----------------------------------------------------------------------------------------------+
| |image034|                                                                                   |
+----------------------------------------------------------------------------------------------+

+----------------------------------------------------------------------------------------------+
| 9. In a fresh (incognito) browser window, navigate to the hostname again with the appended   |
|    query string **http://<username>-app.<delegated domain>/?cmd=cat%20/etc/passwd**.         |
|    You should now see the Volterra block page as shown below.                                |
|                                                                                              |
|    *Note: It make takes a few seconds for the policy to apply.*                              |
+----------------------------------------------------------------------------------------------+
| |image035|                                                                                   |
+----------------------------------------------------------------------------------------------+

TASK: 9: Reviewing Analytics & Security Events 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+----------------------------------------------------------------------------------------------+
| 1. In the Volterra Console, use the left navigation menu to navigate to **Virtual Hosts** >  |
|    **HTTP Load Balancers**.                                                                  |
|                                                                                              |
| 2. In the updated right window, hover over the HTTP Load Balancer created in Task 6, Step 3  |
|    and click the **General Monitoring** link.                                                |
+----------------------------------------------------------------------------------------------+
| |image036|                                                                                   |
+----------------------------------------------------------------------------------------------+

+----------------------------------------------------------------------------------------------+
| 3. Review the available analytics regarding this HTTP Load Balancer, when complete use the   |
|    the drop menu which currently shows **General Monitoring** to select **Security**         |
|    **Monitoring**.                                                                           |
|                                                                                              |
|    *Note: You can refresh the site or script curl the site to add additional statistics.*    |
+----------------------------------------------------------------------------------------------+
| |image037|                                                                                   |
+----------------------------------------------------------------------------------------------+

+----------------------------------------------------------------------------------------------+
| 4. In the Security Monitoring, **Dashboard** you can review applicable security event        |
|    information.                                                                              |
|                                                                                              |
| 5. In the bottom right of the Dashboard view, find the **Recent WAF and Policy Events**      |
|    and click a security event as shown.                                                      |
+----------------------------------------------------------------------------------------------+
| |image038|                                                                                   |
+----------------------------------------------------------------------------------------------+

+----------------------------------------------------------------------------------------------+
| 6. The resulting window provides additional analytics, details and actions that can be used. |
|    Expand the latest security event by clicking the **>** symbol to review additional        |
|    security detail.                                                                          |
+----------------------------------------------------------------------------------------------+
| |image039|                                                                                   |
+----------------------------------------------------------------------------------------------+

+----------------------------------------------------------------------------------------------+
| 7. You can scroll through the expanded security detail view located here for additional      |
|    information regarding the event.                                                          |
+----------------------------------------------------------------------------------------------+
| |image040|                                                                                   |
+----------------------------------------------------------------------------------------------+

+----------------------------------------------------------------------------------------------+
| **STOP**: Prior to executing the clean-up steps that follow, complete any additional review  |
| you wish to do. Enjoy!                                                                       |
+----------------------------------------------------------------------------------------------+
| |imageSTOP|                                                                                  |
+----------------------------------------------------------------------------------------------+

TASK: 10: Clean-Up & End of Lab
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+----------------------------------------------------------------------------------------------+
| 1. In the Volterra Console, use the left navigation menu to navigate to **Manage** > **Load**|
|    **Balancers** and select **HTTP Load Balancers**.                                         |
|                                                                                              |
| 2. In the updated right window, locate the row of the HTTP Load Balancer created in Task 6,  |
|    Step 3 and click the three dots **...** at the far right of the row, and then click       |
|    **Delete** in the resulting pop-up window.                                                |
+----------------------------------------------------------------------------------------------+
| |image041|                                                                                   |
+----------------------------------------------------------------------------------------------+

+----------------------------------------------------------------------------------------------+
| 3. In the Volterra Console, use the left navigation menu to navigate to **Manage** > **Load**|
|    **Balancers** and select **Origin Pools**.                                                |
|                                                                                              |
| 4. In the updated right window, locate the row of the Origin Pool created in Task 6, Step 7  |
|    and click the three dots **...** at the far right of the row, and then click              |
|    **Delete** in the resulting pop-up window.                                                |
+----------------------------------------------------------------------------------------------+
| |image042|                                                                                   |
+----------------------------------------------------------------------------------------------+

+----------------------------------------------------------------------------------------------+
| 5. In the Volterra Console, use the left navigation menu to navigate to **Security** >       |
|    **App Firewall** and select **App Firewalls**.                                            |
|                                                                                              |
| 6. In the updated right window, locate the row of the App Firewall created in Task 5, Step 5 |
|    and click the three dots **...** at the far right of the row, and then click              |
|    **Delete** in the resulting pop-up window.                                                |
+----------------------------------------------------------------------------------------------+
| |image043|                                                                                   |
+----------------------------------------------------------------------------------------------+

+----------------------------------------------------------------------------------------------+
| 7. This concludes this Lab, feel free to run through the lab again as needed.                |
+----------------------------------------------------------------------------------------------+
| |imageEND|                                                                                   |
+----------------------------------------------------------------------------------------------+

.. |imageEND| image:: media/imageEND.png
   :width: 800px
.. |imageSTOP| image:: media/imageSTOP.png
   :width: 800px
.. |image001| image:: media/lab01-001.png
   :width: 800px
.. |image002| image:: media/lab01-002.png
   :width: 800px
.. |image003| image:: media/lab01-003.png
   :width: 800px
.. |image004| image:: media/lab01-004.png
   :width: 800px
.. |image005| image:: media/lab01-005.png
   :width: 800px
.. |image006| image:: media/lab01-006.png
   :width: 800px
.. |image007| image:: media/lab01-007.png
   :width: 800px
.. |image008| image:: media/lab01-008.png
   :width: 800px
.. |image009| image:: media/lab01-009.png
   :width: 800px
.. |image010| image:: media/lab01-010.png
   :width: 800px
.. |image011| image:: media/lab01-011.png
   :width: 800px
.. |image012| image:: media/lab01-012.png
   :width: 800px
.. |image013| image:: media/lab01-013.png
   :width: 800px
.. |image014| image:: media/lab01-014.png
   :width: 800px
.. |image015| image:: media/lab01-015.png
   :width: 800px
.. |image016| image:: media/lab01-016.png
   :width: 800px
.. |image017| image:: media/lab01-017.png
   :width: 800px
.. |image018| image:: media/lab01-018.png
   :width: 800px
.. |image019| image:: media/lab01-019.png
   :width: 800px
.. |image020| image:: media/lab01-020.png
   :width: 800px
.. |image021| image:: media/lab01-021.png
   :width: 800px
.. |image022| image:: media/lab01-022.png
   :width: 800px
.. |image023| image:: media/lab01-023.png
   :width: 800px
.. |image024| image:: media/lab01-024.png
   :width: 800px
.. |image025| image:: media/lab01-025.png
   :width: 800px
.. |image026| image:: media/lab01-026.png
   :width: 800px
.. |image027| image:: media/lab01-027.png
   :width: 800px
.. |image028| image:: media/lab01-028.png
   :width: 800px
.. |image029| image:: media/lab01-029.png
   :width: 800px
.. |image030| image:: media/lab01-030.png
   :width: 800px
.. |image031| image:: media/lab01-031.png
   :width: 800px
.. |image032| image:: media/lab01-032.png
   :width: 800px
.. |image033| image:: media/lab01-033.png
   :width: 800px
.. |image034| image:: media/lab01-034.png
   :width: 800px
.. |image035| image:: media/lab01-035.png
   :width: 800px
.. |image036| image:: media/lab01-036.png
   :width: 800px
.. |image037| image:: media/lab01-037.png
   :width: 800px
.. |image038| image:: media/lab01-038.png
   :width: 800px
.. |image039| image:: media/lab01-039.png
   :width: 800px
.. |image040| image:: media/lab01-040.png
   :width: 800px
.. |image041| image:: media/lab01-041.png
   :width: 800px
.. |image042| image:: media/lab01-042.png
   :width: 800px
.. |image043| image:: media/lab01-043.png
   :width: 800px
.. |image044| image:: media/lab01-044.png
   :width: 800px
