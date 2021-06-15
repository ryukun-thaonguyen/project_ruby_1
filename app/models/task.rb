class Task < ApplicationRecord
  belongs_to :course
  has_many :user_tasks
  has_rich_text :description
end
