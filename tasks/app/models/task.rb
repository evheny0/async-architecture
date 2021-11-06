class Task < ApplicationRecord
  belongs_to :assignee, class_name: "User"
  # belongs_to :creator, class_name: "User"
  enum status: %i(created done)
end
