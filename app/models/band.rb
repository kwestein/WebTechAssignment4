class Band < ActiveRecord::Base
	belongs_to :genre
	has_many :artists, dependent: :destroy
	has_many :albums, dependent: :destroy
	has_many :shows, dependent: :destroy

	validates :name, uniqueness: true
	validates :name, presence: true

	accepts_nested_attributes_for :shows, reject_if: proc { |attributes| attributes['title'].blank? }, allow_destroy: true
	accepts_nested_attributes_for :artists, reject_if: proc { |attributes| attributes['name'].blank? }, allow_destroy: true
end
