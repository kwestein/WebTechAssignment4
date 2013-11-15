class AlbumsController < ApplicationController
	before_filter :load_album, only: [:show, :update, :edit, :destroy]

	def show
	end

	def destroy
		@album.destroy
		redirect_to bands_path
	end

	def edit
		@bands = Band.all
	end

	def update
		@album.update_attributes(params.require(:album).permit(:id, :title, :release_date, :band_id, songs_attributes: [ :id, :title, :ranking]))
		redirect_to album_path(@album)
	end

	def new
		@album = Album.new
		@new_album = Album.new
		@bands = Band.all
	end

	def create
		@album = Album.create!(params.require(:album).permit(:title, :release_date, :band_id, songs_attributes: [ :id, :title, :ranking]))
		redirect_to album_path(@album)
	end

	def load_album
		@album = Album.find(params[:id])
	end
end
