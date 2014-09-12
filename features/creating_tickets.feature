Feature: Creating Tickets
  Customers do not need to login to submit a query.
  They simply provide:
    - their name
    - email address
    - department the issue relates to
    - subject of enquiry
    - a description of the request

Background:
  Given they are on the homepage
  And they choose to create a new ticket

Scenario: a customer creates a valid ticket
  When they complete the form with valid information
  Then they should see "A new Ticket has been created."
