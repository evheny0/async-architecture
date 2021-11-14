class PersonalTasksController < ApplicationController
  def index
    @tasks = Task.where(assignee_id: current_user.id)
  end

  def update
    task = Task.find(params[:id])
    task.update!(status: :proso_v_miske)


    event = {
      event_id: SecureRandom.uuid,
      event_version: 2,
      event_time: Time.now.to_s,
      producer: 'tasks_service',
      event_name: 'TaskCompleted',
      data: {
        public_id: task.public_id,
        status: task.status,
      }
    }
    result = SchemaRegistry.validate_event(event, 'tasks.completed', version: 1)
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
        assignee_id: task.assignee.public_id,
      }
    }
    result = SchemaRegistry.validate_event(event, 'tasks.updated', version: 1)
    WaterDrop::SyncProducer.call(event.to_json, topic: 'tasks-stream') if result.success?

    redirect_to "/"
  end
end
