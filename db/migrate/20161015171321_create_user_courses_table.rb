class CreateUserCoursesTable < ActiveRecord::Migration
  def change
    create_table :user_courses do |x|
      x.integer :user_id
      x.integer :course_id
    end
  end
end
