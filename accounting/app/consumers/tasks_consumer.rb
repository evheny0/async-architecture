class TasksConsumer < ApplicationConsumer
  def consume
    params_batch.each do |message|
      data = message.payload["data"]

      case message.payload["event_name"]
      when "TaskAssigned"
        task = Task.find_by(public_id: data["public_id"])
        balance = Balance.find_by(public_id: data["assignee_id"])
        Transaction.create!(task: task, balance: balance, amount: -task.cost, status: :not_confirmed)
        balance.update!(balance: balance - task.cost)
      when "TaskCompleted"
        task = Task.find_by(public_id: data["public_id"])
        balance = Balance.find_by(public_id: task.assignee_id)
        Transaction.create!(task: task, balance: balance, amount: task.reward, status: :not_confirmed)
        balance.update!(balance: balance - task.cost)
      end
    end
  end
end
