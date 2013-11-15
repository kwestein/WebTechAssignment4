class Artist < ActiveRecord::Base
	belongs_to :band

	validates :name, uniqueness: true
	validates :name, :role, presence: true
end
