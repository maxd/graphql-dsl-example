class CreateTodos < ActiveRecord::Migration[6.1]
  def change
    create_table :todos do |t|
      t.integer :priority, null: false
      t.string :title, null: false

      t.timestamps null: false
    end
  end
end
