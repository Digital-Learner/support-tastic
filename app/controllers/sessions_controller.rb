class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.where(:name => params[:login][:name]).first
    if user && user.authenticate(params[:login][:password])
      session[:user_id] = user.id
      flash[:notice] = "Logged in successfully."
      redirect_to root_url
    else
      flash[:error] = "Cannot find that user and password"
      render :new
    end
  end
end
