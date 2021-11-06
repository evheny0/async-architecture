class PersonalTasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def update
    task = Task.find(params[:id])
    task.update!(status: :done)

    redirect_to "/"
  end
end
