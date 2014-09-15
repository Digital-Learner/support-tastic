class TicketsController < ApplicationController
  def index
  end

  def new
    @ticket = Ticket.new
    @departments = Department.all
  end

  def create
    @ticket = Ticket.new(ticket_params)
    if @ticket.save
      TicketMailer.creation_email(@ticket).deliver
      flash[:notice] = "A new Ticket has been created."
      redirect_to tickets_path
    else
      @departments = Department.all
      flash[:alert] = "Unable to create Ticket."
      render "new"
    end
  end

  def show
    @ticket = Ticket.find_by(reference_id: params[:id])
  end

  private

    def ticket_params
      params.require(:ticket).permit(:name, :email, :subject, :detail, :department_id)
    end
end
