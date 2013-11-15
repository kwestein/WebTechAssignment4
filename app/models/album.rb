class Album < ActiveRecord::Base
	belongs_to :band
	has_many :songs, inverse_of: :album

	validates :title, :identification, uniqueness: true
	validates :title, presence: true

	accepts_nested_attributes_for :songs, reject_if: proc { |attributes| attributes['title'].blank? }, allow_destroy: true
end
