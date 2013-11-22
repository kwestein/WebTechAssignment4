class GenresController < ApplicationController

	before_filter :load_genre, only: [:show, :update, :edit, :destroy]

	def show
	end

	def destroy
		@genre.destroy
		writeToXML
		redirect_to bands_path
	end

	def edit
	end

	def update
		@genre.update_attributes(params.require(:genre).permit(:title, :description))
		writeToXML
		redirect_to genre_path(@genre)
	end

	def new
		@genre = Genre.new
	end

	def create
		@genre = Genre.create(params.require(:genre).permit(:title, :description))
		writeToXML
		redirect_to genre_path(@genre)
	end

	def load_genre
		@genre = Genre.find(params[:id])
	end
end
