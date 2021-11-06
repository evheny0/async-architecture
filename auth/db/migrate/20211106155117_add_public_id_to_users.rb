class AddPublicIdToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :public_id, :string
  end
end
