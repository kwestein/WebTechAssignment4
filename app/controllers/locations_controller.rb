class LocationsController < ApplicationController
	before_filter :load_location, only: [:show, :update, :edit, :destroy]

	def new
		@location = Location.new
	end

	def create
		@location = Location.create(params.require(:location).permit(:venue, :street_address, :city, :country, :continent))
		redirect_to location_path(@location)
	end

	def show
		@location = Location.find(params[:id])
	end

	def edit
	end

	def update
		@location.update_attributes(params.require(:location).permit(:venue, :street_address, :city, :country, :continent))
		redirect_to location_path(@location)
	end

	def load_location
		@location = Location.find(params[:id])
	end

	def destroy
		@location.destroy
		redirect_to bands_path
	end
end
