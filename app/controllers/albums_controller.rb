class AlbumsController < ApplicationController
	before_filter :load_album, only: [:show, :update, :edit, :destroy]

	def show
	end

	def destroy
		band = @album.band
		@album.destroy
		writeToXML
		case params[:from]
		when "edit_band"
			redirect_to edit_band_path(band)
		when nil
			redirect_to bands_path
		end
	end

	def edit
		@bands = Band.all
		@new_album = Album.new
	end

	def update
		@album.update_attributes(params.require(:album).permit(:title, :release_date, :band_id, songs_attributes: [ :id, :title, :ranking ]))
		writeToXML
		redirect_to album_path(@album)
	end

	def new
		@album = Album.new
		@new_album = Album.new
		@bands = Band.all
		@album.band_id = Band.find(params[:band_id]).id if params[:band_id].present?
	end

	def create
		@album = Album.create(params.require(:album).permit(:title, :release_date, :band_id, songs_attributes: [ :id, :title, :ranking ]))
		writeToXML
		redirect_to edit_band_path(@album.band)
	end

	def index
		@albums = Album.all.order('title')
	end

	def load_album
		@album = Album.find(params[:id])
	end
end
