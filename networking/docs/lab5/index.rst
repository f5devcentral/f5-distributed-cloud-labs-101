Lab 5: Optional Exercises
=========================

In case you managed to complete all the previous labs in record time the following
are some unscripted suggestions of what else you can try.

Expose VIP on AWS Site
~~~~~~~~~~~~~~~~~~~~~~~

Instead of using a Regional Edge to expose the frontend service use the External
Network of the AWS Site to expose the service.  Access the frontend service with 
the EIP of the VoltMesh node in AWS. (you may need to use curl --resolve ...)

Expose frontend in both AWS/UDF
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In addition to making the frontend available in an RE/AWS also make it available
from UDF (i.e. you will see either AWS/UDF when accessing the frontend).

Expose the VIP in the UDF environment as well and access the service
using the VoltMesh node in UDF.

Change the affinity to show both AWS/UDF in each site or prefer the frontend in that site.

Check the routing from AWS to UDF from the frontend
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Use ssh forwarding from the UDF Ubuntu Client to access the AWS "jumphost" and "frontend".

From the "frontend" verify that you have access to the "backend" service in UDF.

Expose backend through routing
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Modify the deployment of the frontend in AWS to route directly to the backend in UDF.

This will require modifying the terraform that creates the frontend in AWS or logging into the 
frontend to modify the running Docker container.

