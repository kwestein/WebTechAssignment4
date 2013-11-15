class ArtistsController < ApplicationController
	before_filter :load_artist, only: [:show, :update, :edit, :destroy]

	def show
	end

	def destroy
		@artist.destroy
		redirect_to bands_path
	end

	def edit
		@bands = Band.all
	end

	def update
		@artist.update_attributes(params.require(:artist).permit(:name, :biography, :birthday, :role, :join_date))
		redirect_to artist_path(@artist)
	end

	def new
		@artist = Artist.new
	end

	def create
		@artist = Artist.create(params.require(:artist).permit(:name, :biography, :birthday, :role, :join_date))
		redirect_to artist_path(@artist)
	end

	def load_artist
		@artist = Artist.find(params[:id])
	end
end
