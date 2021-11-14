class Task < ApplicationRecord
  enum status: %i(created done ptichka_v_kletke proso_v_miske)
end
