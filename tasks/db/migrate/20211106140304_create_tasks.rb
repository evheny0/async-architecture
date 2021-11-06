class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.bigint :assignee_id
      t.bigint :creator_id
      t.integer :status
      t.string :public_id, null: false
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
