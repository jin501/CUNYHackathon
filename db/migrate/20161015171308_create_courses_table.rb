class CreateCoursesTable < ActiveRecord::Migration
  def change
    create_table :courses do |x|
      x.string :name
      x.integer :credits
      x.string :courseid
      x.string :type
      x.string :prereqs
      x.integer :major_id
    end
  end
end
