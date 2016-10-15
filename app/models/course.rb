class Course < ActiveRecord::Base

  belongs_to :major
  has_many :users, through: :user_courses
  has_many :user_courses

end
