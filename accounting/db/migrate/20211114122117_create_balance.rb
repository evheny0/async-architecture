class CreateBalance < ActiveRecord::Migration[6.1]
  def change
    create_table :balances do |t|
      t.bigint :user_id
      t.integer :balance

      t.timestamps
    end
  end
end
