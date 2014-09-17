Feature: Creating comments
  I want to be able to add comments
  As a user
  So that a tickets history/progress can be recorded

Background:
  Given there is a ticket which is not closed

Scenario: Staff member adds comment
  Given I am able to add comments to the ticket
  And I add valid details to the comments form
  Then I should see the comment on the ticket
