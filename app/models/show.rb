class Show < ActiveRecord::Base
	belongs_to :band
	belongs_to :location

	validates :title, :identification, uniqueness: true
	validates :title, presence: true
end
