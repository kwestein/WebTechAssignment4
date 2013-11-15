class ShowsController < ApplicationController
	before_filter :load_show, only: [:show, :update, :edit, :destroy]

	def show
		@show = Show.find(params[:id])
	end

	def edit
		@bands = Band.all
		@locations = Location.all
	end

	def update
		@show.update_attributes(params.require(:show).permit(:title, :date, :venue, :location_id, :band_id))
		redirect_to show_path(@show)
	end

	def destroy
		@show.destroy
		case params[:from]
		when "edit_band"
			redirect_to edit_band_path(@show.band)
		when nil
			redirect_to bands_path
		end
	end

	def new
		@show = Show.new
		@bands = Band.all
		@show.band_id = Band.find(params[:band_id]).id
		@locations = Location.all
	end

	def create
		@show = Show.create(params.require(:show).permit(:title, :date, :venue, :location_id, :band_id))
		redirect_to edit_band_path(@show.band)
	end

	def load_show
		@show = Show.find(params[:id])
	end
end
