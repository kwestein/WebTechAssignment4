class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
    	t.text :venue
    	t.text :street_address
    	t.string :city
    	t.string :country
    	t.string :continent
    	t.string :identification

      t.timestamps
    end
  end
end
