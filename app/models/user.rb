class User < ActiveRecord::Base
  has_secure_password

  has_many :courses, through: :user_courses
  has_many :user_courses
  belongs_to :major

  def slug
    username.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    User.all.find {|u| u.slug == slug}
  end

end