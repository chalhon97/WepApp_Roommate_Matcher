class CreateListingsTable < ActiveRecord::Migration
  def change
  		create_table :listings do |t|
			t.string :location
			t.integer :age
			t.string :image_url
			t.string :caption
			t.integer :user_id
		end
  end
end
