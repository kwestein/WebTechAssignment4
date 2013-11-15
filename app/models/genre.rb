class Genre < ActiveRecord::Base
	has_many :related_genres, :foreign_key => 'related_genre_id', :class_name => 'Genre'
  	belongs_to :related_to, :class_name => 'Genre'
  	has_many :bands

  	validates :title, :identification, uniqueness: true
  	validates :title, presence: true

end
