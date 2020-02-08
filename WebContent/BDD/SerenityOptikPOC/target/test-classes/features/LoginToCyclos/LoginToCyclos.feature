@version:Release_4
@version:Sprint_9
Feature: LoginToCyclos
As a user I want to check Login To Cyclos functionality.


Scenario: Cyclos Login functionality.
Given user is logged in with userid "shashiranjan" and password "Capg1234"
When user selects logout
Then user should be back to login page
