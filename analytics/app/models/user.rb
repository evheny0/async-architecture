class User < ApplicationRecord
  enum role: %i(user admin)
end
