class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
    	t.string :title
    	t.datetime :release_date
    	t.string :identification
    	t.belongs_to :band, index: true

      	t.timestamps
    end
  end
end
