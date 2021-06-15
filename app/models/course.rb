class Course < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, length: { maximum: 200 }
  validates :description, presence: true, length: { maximum: 2000 }
  has_many :user_courses
  has_many :tasks, dependent: :destroy
end
