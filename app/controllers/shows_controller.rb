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
		redirect_to bands_path
	end

	def load_show
		@show = Show.find(params[:id])
	end
end
