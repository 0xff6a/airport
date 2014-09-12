Week 3 Challenge @ Makers Academy: Airport Management using OO
==============================================================

Ruby Version:
-------------
Ruby 2.1.2

Objectives:
-----------
- Implement software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off
- Create a set of classes/modules and demonstrate planes taking-off/landing at different airports in different weather conditions
- Ensure full test coverage throughout using the london-style

Classes:
--------
- Plane: has a state of flying or landed
- Airport: holds planes up to its maximum capacity. Allows planes to take-off and land

Modules:
-------
- Weather: has a state of either sunny or stormy based on a random number generator and storm probability

Running the application:
------------------------
$ ruby ./lib/run.rb

Running the test suite:
-----------------------
$ rspec from root

