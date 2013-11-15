class CreateBands < ActiveRecord::Migration
  def change
    create_table :bands do |t|
    	t.string :name
    	t.string :identification
    	t.belongs_to :genre, index: true

      	t.timestamps
    end
  end
end
