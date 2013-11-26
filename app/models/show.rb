class Show < ActiveRecord::Base
	belongs_to :band
	belongs_to :location

	#validates :title, uniqueness: true
	#validates :title, presence: true
end
