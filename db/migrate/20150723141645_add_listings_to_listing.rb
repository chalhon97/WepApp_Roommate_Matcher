class AddListingsToListing < ActiveRecord::Migration
  def change
  		add_column(:listings,:borough,:string)
		add_column(:listings,:minage,:integer)
		add_column(:listings,:maxage,:integer)
		add_column(:listings,:sex,:string)
		add_column(:listings,:smoking,:string)
		add_column(:listings,:pets,:string)
		add_column(:listings,:minprice,:integer)
		add_column(:listings,:maxprice,:integer)
  end
end
