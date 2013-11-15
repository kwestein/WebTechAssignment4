class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
    	t.string :title
    	t.integer :ranking
    	t.string :identification
    	t.belongs_to :album, index: true

      	t.timestamps
    end
  end
end
