class User < ApplicationRecord
  enum role: %i(user admin)
  has_one :balance
  has_many :transactions
end
