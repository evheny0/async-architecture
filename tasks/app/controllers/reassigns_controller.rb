class ReassignsController < ApplicationController
  def create
    user_ids = User.where(role: :user).pluck(:id)
    Task.where(status: :created).find_each do |task|
      task.update!(assignee_id: user_ids.sample)
    end

    redirect_to "/"
  end
end
