class AccountsController < ApplicationController
  def current
    user = User.find(doorkeeper_token.resource_owner_id)
    render json: { public_id: user.public_id, email: user.email, role: user.role }
  end

  def index
    @users = User.all
  end

  def update
    user = User.find(params[:id])
    user.update!(user_params)

    event = {
      event_name: 'AccountUpdated',
      data: {
        public_id: user.public_id,
        role: user.role,
      }
    }
    KafkaProducer.produce_sync(topic: 'accounts-stream', payload: event.to_json)

    redirect_to "/"
  end

  private

  def user_params
    params.require(:user).permit(:role)
  end
end
