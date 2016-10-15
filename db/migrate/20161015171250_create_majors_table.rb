class CreateMajorsTable < ActiveRecord::Migration
  def change
    create_table :majors do |x|
      x.string :name
      x.integer :credits
    end
  end
end
