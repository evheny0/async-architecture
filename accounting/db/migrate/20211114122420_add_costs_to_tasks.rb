class AddCostsToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :cost, :integer
    add_column :tasks, :reward, :integer
  end
end
