class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
  end

  def create
    Task.create!(task_params.merge(public_id: SecureRandom.uuid))

    redirect_to tasks_path
  end

  def edit
    @task = Task.find_by(params[:id])
  end

  def update
    @task = Task.find_by(params[:id])
    @task.update!(task_params)

    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :assignee_id)
  end
end
