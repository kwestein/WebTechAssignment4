module AlbumsHelper
	def add_song(album)
		album.songs << Song.new
	end
end
