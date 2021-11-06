class AccountsController < ApplicationController
  def current
    user = User.find(doorkeeper_token.resource_owner_id)
    render json: { public_id: user.public_id, email: user.email, role: user.role }
  end

  def index
    @users = User.all
  end
end
