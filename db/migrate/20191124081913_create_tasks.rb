class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.belongs_to :user

      t.string :title, null: false
      t.string :labels, array: true, default: []
      t.boolean :is_starred, default: false
      t.text :description

      t.datetime :due_date
      t.datetime :completed_at

      t.timestamps
    end
  end
end
