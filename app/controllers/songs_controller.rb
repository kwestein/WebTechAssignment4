class SongsController < ApplicationController
	def create
	    Song.create(params[:song].permit(:title, :ranking, :album_id))
	end

	def destroy
	  @song = Song.find(params[:id])
	  album = @song.album
	  @song.destroy
	  redirect_to edit_album_path(album)
	end
end
