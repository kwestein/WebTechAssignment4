class Band < ActiveRecord::Base
	belongs_to :genre
	has_many :artists, dependent: :destroy
	has_many :albums, dependent: :destroy
	has_many :shows, dependent: :destroy

	validates :name, :identification, uniqueness: true
	validates :name, presence: true
end
