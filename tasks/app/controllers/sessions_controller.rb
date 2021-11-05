class SessionsController < ApplicationController
  def create
    request.env["omniauth.auth"]
  end

  def failure
    binding.pry
  end

  def index
  end
end
