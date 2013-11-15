class Location < ActiveRecord::Base
	has_many :shows

	validates :venue, presence: true
	validates :identification, uniqueness: true
end
