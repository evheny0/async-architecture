class TasksStreamConsumer < ApplicationConsumer
  def consume
    params_batch.each do |message|
      data = message.payload["data"]

      case message.payload["event_name"]
      when "TaskCreated"
        Task.create!(
          public_id: data["public_id"],
          assignee_id: data["assignee_id"],
          creator_id: data["creator_id"],
          status: data["status"],
          description: data["description"]
          cost: rand(10..20),
          reward: rand(20..40)
        )
      when "TaskUpdated"
        Task.find_by(public_id: data["public_id"]).update!(assignee_id: data["assignee_id"], status: data["status"])
      end
    end
  end
end
