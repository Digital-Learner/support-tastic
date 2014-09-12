class TicketsController < ApplicationController
  def index
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    if @ticket.save
      flash[:notice] = "A new Ticket has been created."
      redirect_to tickets_path
    end

  end

  private

    def ticket_params
      params.require(:ticket).permit(:name, :email, :subject, :detail)
    end
end
