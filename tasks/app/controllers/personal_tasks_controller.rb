class PersonalTasksController < ApplicationController
  def index
    @tasks = Task.where(assignee_id: current_user.id)
  end

  def update
    task = Task.find(params[:id])
    task.update!(status: :done)

    redirect_to "/"
  end
end
