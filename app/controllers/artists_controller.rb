class ArtistsController < ApplicationController
	before_filter :load_artist, only: [:show, :update, :edit, :destroy]

	def show
	end

	def destroy
		band = @artist.band
		@artist.destroy
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
	end

	def update
		@artist.update_attributes(params.require(:artist).permit(:name, :biography, :birthday, :role, :join_date, :band_id))
		writeToXML
		redirect_to artist_path(@artist)
	end

	def create
		@artist = Artist.create(params.require(:artist).permit(:name, :biography, :birthday, :role, :join_date, :band_id))
		writeToXML
		redirect_to edit_band_path(@artist.band)
	end

	def new
		@artist = Artist.new
		@artist.band_id = Band.find(params[:band_id]).id if params[:band_id].present?
		@bands = Band.all
	end

	def load_artist
		@artist = Artist.find(params[:id])
	end
end
