class UserCourse < ApplicationRecord
  validates :course_id, uniqueness: { scope: :user_id, message: "User already exists for this date." }
  belongs_to :user
  belongs_to :course
end
