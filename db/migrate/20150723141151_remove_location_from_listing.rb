class RemoveLocationFromListing < ActiveRecord::Migration
  def change
  	remove_column :listings, :location
  	remove_column :listings, :age
  end
end
