@version:Release_3
@version:Sprint_8
Feature: MessageToMember
As a user I want to use messages for communication between me and my contact members
by using  Send message functionality.

Scenario: Verify Send message functionality.
Given I send a message to selected contact from contacts list with subject line and text body
When I Login with receiver credential and check messages
Then Message should be received to receiver
