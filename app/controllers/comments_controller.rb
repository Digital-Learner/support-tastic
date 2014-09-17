class CommentsController < ApplicationController
  before_action :find_ticket

  def create
    @comment = @ticket.comments.build(comment_params)
    if @comment.save
      flash[:notice] = "Comment recorded and ticket updated."
      redirect_to ticket_path(@ticket.reference_id)
    end
  end

  private

    def find_ticket
      @ticket = Ticket.find_by(reference_id: params[:ticket_id])
    end

    def comment_params
      params.require(:comment).permit(:comment)
    end
end
