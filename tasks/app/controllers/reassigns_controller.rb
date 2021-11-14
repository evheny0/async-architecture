class ReassignsController < ApplicationController
  def create
    user_ids = User.where(role: :user).pluck(:id, :public_id)
    Task.where(status: :created).find_each do |task|
      user_id = user_ids.sample
      task.update!(assignee_id: user_id.first)


      event = {
        event_id: SecureRandom.uuid,
        event_version: 1,
        event_time: Time.now.to_s,
        producer: 'tasks_service',
        event_name: 'TaskAssigned',
        data: {
          public_id: task.public_id,
          assignee_id: user_id.second,
        }
      }
      result = SchemaRegistry.validate_event(event, 'tasks.assigned', version: 1)
      WaterDrop::SyncProducer.call(event.to_json, topic: 'tasks') if result.success?

      event = {
        event_id: SecureRandom.uuid,
        event_version: 2,
        event_time: Time.now.to_s,
        producer: 'tasks_service',
        event_name: 'TaskUpdated',
        data: {
          public_id: task.public_id,
          status: task.status,
          assignee_id: user_id.second,
        }
      }
      result = SchemaRegistry.validate_event(event, 'tasks.updated', version: 1)
      WaterDrop::SyncProducer.call(event.to_json, topic: 'tasks-stream') if result.success?
    end

    redirect_to "/"
  end
end
