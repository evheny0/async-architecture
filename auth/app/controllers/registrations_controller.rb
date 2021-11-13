class RegistrationsController < Devise::RegistrationsController
  def create
    super
    resource.update!(public_id: SecureRandom.uuid, role: :user)

    event = {
      event_id: SecureRandom.uuid,
      event_version: 1,
      event_time: Time.now.to_s,
      producer: 'auth_service',
      event_name: 'AccountCreated',
      data: {
        public_id: resource.public_id,
        email: resource.email,
        role: resource.role
      }
    }
    result = SchemaRegistry.validate_event(event, 'accounts.created', version: 1)

    if result.success?
      KafkaProducer.produce_sync(topic: 'accounts-stream', payload: event.to_json)
    end
  end
end 
