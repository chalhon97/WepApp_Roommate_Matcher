class CreateUsersTable < ActiveRecord::Migration
  def change
  			create_table :users do |t|
			t.string :firstname
			t.string :lastname
			t.string :email
			t.string :username
			t.string :password
			t.datetime :birthdate
			t.string :sex
			t.string :smoking
			t.string :pets
			t.integer :price
	
		end
  end
end
