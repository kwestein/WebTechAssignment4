class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
    	t.string :name
    	t.text :biography
    	t.datetime :birthday
    	t.string :role
    	t.datetime :join_date
    	t.string :identification
      	t.belongs_to :band, index: true

      	t.timestamps
    end
  end
end
