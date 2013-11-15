class BandsController < ApplicationController
	before_filter :load_band, only: [:show, :update, :edit, :destroy]

  def index
  	@bands = Band.all.sort_by!{ |b| b.name }
  end

  def show
  end

  def edit
  	@genres = Genre.all
  	@new_band = Band.new
  end

  def update
  	@band.update_attributes(params.require(:band).permit(:name, :description, :genre_id, artists_attributes: [ :id, :name, :biography, :role, :birthday, :join_date, :_destroy ]))
	  redirect_to band_path(@band)
  end

  def destroy
  	@band.destroy
  	redirect_to bands_path
  end

  def new
    @band = Band.new
    @genres = Genre.all
  end

  def create
    @genre = Band.create(params.require(:band).permit(:name, :description, :genre_id))
    redirect_to band_path(@genre)
  end

  def load_band
  	@band = Band.find(params[:id])
  end

  def search_names
    band = Band.find_by_name(params[:name])
    if band.present? 
      redirect_to band_path(band)
    else 
      @name = params[:name]
    end
  end

end