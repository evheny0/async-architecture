class SessionsController < ApplicationController
  def create
    request.env["omniauth.auth"]
    redirect_to '/'
  end

  def failure
    binding.pry
  end

  def index
  end
end
