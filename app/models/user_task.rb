class UserTask < ApplicationRecord
  validates :task_id, uniqueness: { scope: :user_id, message: "User already exists for this task" }
  belongs_to :user
  belongs_to :task
end
