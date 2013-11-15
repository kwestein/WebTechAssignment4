class Location < ActiveRecord::Base
	has_many :shows

	validates :venue, presence: true, uniqueness: true
end
