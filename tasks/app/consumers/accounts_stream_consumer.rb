class AccountsStreamConsumer < ApplicationConsumer
  def consume
    params_batch.each do |message|
      payload = message.payload

      case payload["event_name"]
      when "AccountCreated"
        User.create!(email: payload["data"]["email"], public_id: payload["data"]["public_id"], role: payload["data"]["role"])
      when "AccountUpdated"
        User.find_by(public_id: payload["data"]["public_id"]).update!(role: payload["data"]["role"])
      end
    end
  end
end
