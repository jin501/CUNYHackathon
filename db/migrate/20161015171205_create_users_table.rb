class CreateUsersTable < ActiveRecord::Migration
  def change
    create_table :users do |x|
      x.string :name
      x.string :email
      x.string :username
      x.string :password_digest
      x.integer :major_id
      x.integer :credits
    end
  end
end
