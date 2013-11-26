module BandsHelper
	def add_artist(band)
		band.artists << Artist.new
	end

	def add_show(band)
		band.shows << Show.new
	end
end
