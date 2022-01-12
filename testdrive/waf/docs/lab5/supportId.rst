Support ID
==========

In the previous lab exercises you may have noticed that a "support ID" appears 
when you trigger a WAF block.

.. code-block::
   
   The requested URL was rejected. Please consult with your administrator.
   
   Your support ID is: 218bdf56-f34a-42f4-931b-1ba5f8873353
   
   [Go Back]
   
We can use the reported support ID to disable specific signatures.  

Exercise 1: Generate Cross Site Scripting (XSS)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#. Send the following request to your `studentxxx.sales-public.f5demos.com` site

   ``/headers/?username=<script>window.open(%27hello%20world%27);</script>``

#. Retrieve the "support ID" that is displayed.
#. From the Volterra Console go back to "Security Events" (from Lab 2 / Exercise 6)
#. Change the timespan to "Last one hour"   
#. Click on "Add Filter" under Security events
#. Select "req_id"
   
   .. warning:: If you do not see "req_id" you may need to do a hard reset of your 
                web browser window to view the Keys.  
                You can do this with Chrome Developer tools enabled and the 
                following directions: https://developers.google.com/web/updates/2015/05/hard-reload
#. Select the Operator "In"
#. Select the value that matches the support ID.
   
   .. image:: ../_static/filter-security-events-req-id.png
#. At the bottom of the page you should see the desired Security Event.  Scroll to the far right to look for the "Actions" column and click on the three dots "..."
#. Select "Create Exception Rule" from the "Actions" menu
   
   .. image:: ../_static/create-exception-rule-action.png
      :width: 75%

Exercise 2: Creating Exception Rule
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#. Take note of the list of security IDs that are listed.

   .. image:: ../_static/waf-exclusion-rules-ids.png
      :width: 75%
#. Search for one of the IDs at: https://clouddocs.f5.com/cloud-services/latest/f5-cloud-services-Essential.App.Protect-Details.html
   For example searching for "200000091" should return a "XSS script tag end (Headers)" signature.
#. Click on "Apply" you will now be taken into the HTTP Load Balancer configuration and you should see under "WAF Exclusion Rules" it should show as "Configured"
#. Scroll to the bottom of the page and click on "Save and Exit"
#. Retry visiting your site with the same URL to your `studentxxx.sales-public.f5demos.com` site

   ``/headers/?username=<script>window.open(%27hello%20world%27);</script>``

Excercise 3: View Requests Log
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

We can also view requests that have been excluded from a WAF policy by viewing 
the requests log.

#. From the "Security Events" page in VoltConsole click on the "Requests" menu item at the top of the page.
#. Look for a "GET" request for `/headers/` and click on the arrow on the left of the date to expand the entry.
#. Observe that under "Policy Hits" you will see the WAF exclusion rule that was triggered.
   
   .. image:: ../_static/requests-policy-exclusion.png
      :width: 50%
#. Try visiting your site with the a different URL to your `studentxxx.sales-public.f5demos.com` site
   ``/txt/?username=<script>window.open(%27hello%20world%27);</script>``
#. Observe that this request is blocked.  Volterra WAF can exclude signatures by both signature ID and path; and these exclusions are tied to a specific HTTP Load Balancer

Congratulations you have completed the lab!