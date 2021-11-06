class AccountsController < ApplicationController
  def current
    render json: { public_id: "123", email: "a@a.com" }
  end

  def index
    @users = User.all
  end
end
