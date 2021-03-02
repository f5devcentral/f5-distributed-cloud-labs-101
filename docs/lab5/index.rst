Optional Exercises
==================

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

As a bonus expose the VIP in the UDF environment as well and access the service
using the VoltMesh node in UDF.

