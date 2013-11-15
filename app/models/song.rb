class Song < ActiveRecord::Base
	belongs_to :album
	validates :title, presence: true, uniqueness: true
end
