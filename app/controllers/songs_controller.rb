class SongsController < ApplicationController
	def create
	    Song.create(params[:song].permit(:title, :ranking, :album_id))
	end

	def destroy
	  @song = Song.find(params[:id])
	  @song.destroy
	end
end
