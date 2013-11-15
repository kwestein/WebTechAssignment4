class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
    	t.string :title
    	t.datetime :date
    	t.string :identification
    	t.belongs_to :location, index: true
    	t.belongs_to :band, index: true

      	t.timestamps
    end
  end
end
