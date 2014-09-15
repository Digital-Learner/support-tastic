Feature: Viewing Tickets
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
  And they should receive an email with a link to ticket

Scenario: a customer creates a ticket without valid attributes
  When they submit an incomplete form or form with invalid information
  Then they should see "Unable to create Ticket."
  And an error message should be presented


# Each member of staff should have a username & password used to login to the system
# Staff can view a list of all to take ownership:
# - unassigned
# - open tickets

# Staff should be able to reply to the ticket by simply entering their response into a text field.
# As part of the same action, they should also be able to change the owner or status.
# All changes to the status and owner should be tracked with each staff reply.
# All replies should be e-mailed to the client.

# Each ticket should be assigned a status:
#  - ʻWaiting for Staff Responseʼ
#  - ʻWaiting for Customerʼ
#  - ʻOn Holdʼ
#  - ʻCancelledʼ
#  - ʻCompletedʼ - status(-es) may wish to be added in the future.

# When a ticket is first created or updated by the customer, it should be assigned the ʻWaiting for Staff Responseʼ status.

# The interface should have four main views:

# - New unassigned tickets
# - Open Tickets
# - On hold tickets
# - Closed Tickets

# Staff should be able to quickly open up a new ticket by entering itʼs reference number into a search field. They may also wish to search based on the ticket subject. Also please allow users to look for words or combinations of words found in the ticket.
