class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :description
      t.integer :score, :default => 0
      t.timestamp :due_date
      t.references :course, null: false, foreign_key: true
      t.boolean :status, :default => false
      t.timestamps
    end
    add_index :tasks, [:course_id, :created_at]
  end
end
