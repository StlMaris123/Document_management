class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      flash.now[:alert] = 'invalid name/password confirmation' 
      render 'new'
    end
  end
end
