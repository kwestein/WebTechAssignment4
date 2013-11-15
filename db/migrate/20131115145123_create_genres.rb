class CreateGenres < ActiveRecord::Migration
  def change
    create_table :genres do |t|
    	t.string :title
    	t.text :description
    	t.string :identification
    	t.integer :related_genre_id

      	t.timestamps
    end
  end
end
