class CreateSubjects < ActiveRecord::Migration[6.1]
  def change
    create_table :subjects do |t|
      t.string :name
      t.string :description
      t.timestamp :start_date
      t.timestamp :end_date
      t.boolean :status
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
    add_index :subjects, [:course_id, :created_at]
  end
end
