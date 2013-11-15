class Album < ActiveRecord::Base
	belongs_to :band
	has_many :songs

	validates :title, :identification, uniqueness: true
	validates :title, presence: true
end
