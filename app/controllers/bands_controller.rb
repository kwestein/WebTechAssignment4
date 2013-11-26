class BandsController < ApplicationController
	before_filter :load_band, only: [:show, :update, :edit, :destroy]

  def index
    @bands = Band.paginate(:page => params[:page], :per_page => 2)
    @genres = Genre.all
    @albums = Album.all
  end

  def show
  end

  def edit
  	@genres = Genre.all
    @locations = Location.all
  	@new_band = Band.new
  end

  def update
  	@band.update_attributes(params.require(:band).permit(:name, :description, :genre_id, artists_attributes: [ :id, :name, :biography, :role, :birthday, :join_date, :_destroy ], shows_attributes: [ :id, :title, :date, :venue, :location_id, :_destroy ]))
    writeToXML
	  redirect_to band_path(@band)
  end

  def destroy
  	@band.destroy
    writeToXML
  	redirect_to bands_path
  end

  def new
    @band = Band.new
    @new_band = Band.new
    @genres = Genre.all
  end

  def create
    @genre = Band.create(params.require(:band).permit(:name, :description, :genre_id, artists_attributes: [ :id, :name, :biography, :role, :birthday, :join_date, :_destroy ], shows_attributes: [ :id, :title, :date, :venue, :location_id, :_destroy ]))
    writeToXML
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

  def search_genres
    @bands = Band.where(genre_id: params[:genre_id])
    @genre = Genre.find(params[:genre_id]).title
    if @bands.empty?
      @found = false
    else
      @found = true
    end
  end

  def search_albums
    album = Album.find(params[:album_id])
    band = Band.find(album.band_id)
    if band.present? 
      redirect_to band_path(band)
    else 
      @album = album.name
    end
  end
end