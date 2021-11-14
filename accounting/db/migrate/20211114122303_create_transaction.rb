class CreateTransaction < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.bigint :balance_id
      t.bigint :task_id
      t.integer :amount
      t.integer :status

      t.timestamps
    end
  end
end
