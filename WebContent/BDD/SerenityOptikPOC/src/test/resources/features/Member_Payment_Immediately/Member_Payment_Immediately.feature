@version:Release_1
@version:Sprint_1
Feature: Member_Payment_Immediately
As a Cyclos customer
He should be able to transfer money to beneficiary account

Scenario: Immediate Payment to Registered Contacts
Given user is logged in with userid "shashiranjan" and password "Capg1234"
When user selects a member and makes payment
Then paid amount should reflect in beneficiary account
