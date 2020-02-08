@version:Release_2
@version:Sprint_5
Feature: Invoice_To_Member
As a user I want to send invoice to one of my contacts by using Send Invoice functionality 
so that amount gets credited on his/her account with acceptance


Scenario: Verify Sent Invoice functionality for sender and receiver both
Given I send an invoice message for selected contact from contacts list
And login with beneficiary credential and accept invoice messages
When I check sender and beneficiary account details
Then Invoice amount should get debited from sender account and credited to beneficiary  account
