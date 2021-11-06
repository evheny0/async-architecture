class SessionsController < ApplicationController
  skip_before_action :login_if_not

  def create
    user = User.find_by(public_id: request.env["omniauth.auth"]["info"]["public_id"])
    request.session[:user_id] = user.id
    
    redirect_to "/"
  end

  def destroy
    request.session[:user_id] = nil

    redirect_to "/"
  end

  def failure
    redirect_to "/"
  end

  def show
  end
end
