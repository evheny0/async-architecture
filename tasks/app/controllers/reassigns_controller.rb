class ReassignsController < ApplicationController
  def create
    user_ids = User.where(role: :user).pluck(:id, :public_id)
    Task.where(status: :created).find_each do |task|
      user_id = user_ids.sample
      task.update!(assignee_id: user_id.first)

      event = {
        event_name: 'TaskAssigned',
        data: {
          public_id: task.public_id,
          assignee_id: user_id.second,
        }
      }
      WaterDrop::SyncProducer.call(event.to_json, topic: 'tasks')

      event = {
        event_name: 'TaskUpdated',
        data: {
          public_id: task.public_id,
          assignee_id: user_id.second,
        }
      }
      WaterDrop::SyncProducer.call(event.to_json, topic: 'tasks-stream')
    end

    redirect_to "/"
  end
end
