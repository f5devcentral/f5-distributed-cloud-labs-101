State 1
=======
The DemoBrews app is currently running in an on-prem data center (the lab's UDF deployment). After attending a retreat
hosted by local AWS account executives, the company's CTO has decided to start migrating assets into AWS. We want to start
using the company's current cloud presence before the CTO attends another retreat from a competing CSP.

<move to prework?>

About the App
^^^^^^^^^^^^^
The app is made up of multiple services.

Single Page Application (SPA)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
The customer has built a `single page application <https://en.wikipedia.org/wiki/Single-page_application>`_ (SPA).
A client's browser or mobile app retrieves all relevant assets (javascript, css, html) with a single page load (a GET to "/").
The static content for the SPA is hosted as it's own service.

API Service
^^^^^^^^^^^^
The client's SPA retrieves app contents by interacting with the API service. This includes retrieving product images,
product descriptions, shopping cart data, etc.

Database Service
^^^^^^^^^^^^^^^^
The customer's database site on-prem. The API service makes queries to the database in order to retrieve assets like
product descriptions and shopping cart data.

Section Goals
-------------
The customer's application is only available through their on-prem data center.
In this step, we will publish the application through VoltConsole so all web traffic comes 
through the Volterra Global Network. This will help us prepare for future states of the project.  

In this state we will configure the following VoltConsole components:
- HTTP Load Balancer
- 2 x Origin Pools

Data Flow and Architecture
--------------------------
The application data flow at this stage is straightforward.

|state1|

The architecture is confined to the customer's on-prem data center.

|arch1|

.. toctree::
   :maxdepth: 1
   :caption: Contents:

httplb