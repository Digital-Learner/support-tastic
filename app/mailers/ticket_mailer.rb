class TicketMailer < ActionMailer::Base
  default from: "support-tastic@example.com"

  def creation_email(ticket)
    @creator = ticket.name
    @reference_id = ticket.reference_id
    @subject = ticket.subject
    mail(to: ticket.email,
         subject: "Support Request: #{@subject}, Ticket Reference: #{@reference_id}"
        )
  end
end
