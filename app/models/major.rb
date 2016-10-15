class Major < ActiveRecord::Base

  has_many :courses
  has_many :users


end
