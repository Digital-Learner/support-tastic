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

Scenario: a customer creates a ticket without valid attributes
  When they submit an incomplete form or form with invalid information
  Then they should see "Unable to create Ticket."
  And an error message should be presented

  # How do we do these type of tests 'Declaratively' vs. this old 'Imperative' style?
  # TODO: Research
  # And they should see "Name can't be blank"
  # And they should see "Email can't be blank"
  # And they should see "Subject can't be blank"
  # And they should see "Detail can't be blank"
