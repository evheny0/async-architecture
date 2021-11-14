class Transaction < ApplicationRecord
  enum status: %i(not_confirmed confirmed)
  belongs_to :task
  belongs_to :user
end
