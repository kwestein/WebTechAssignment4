class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def writeToXML
  	@locations = Location.all
  	@genres = Genre.all 
  	@bands = Band.all

  	builder = Nokogiri::XML::Builder.new do |xml|
		xml.collection {
			@locations.each do |location|
				xml.location(id: location.identification) {
					xml.venue location.venue
					xml.streetAddress location.street_address
					xml.city location.city
					xml.country location.country
					xml.continent location.continent
				}
			end

			@genres.each do |genre|
				xml.genre(id: genre.identification, title: genre.title) {
					xml.description genre.description if genre.description.present?
				}
			end

			@bands.each do |band|
				xml.band(id: band.identification, genre: band.genre.identification) {
					xml.name band.name
					band.artists.each do |artist|
						xml.artist(id: artist.identification) {
							xml.name artist.name
							xml.biography artist.biography if artist.biography.present?
							if artist.birthday.present?
								xml.birthday {
									xml.day artist.birthday.day
									xml.month artist.birthday.month
									xml.year artist.birthday.year
								}
							end
							xml.role artist.role
							if artist.join_date.present?
								xml.join_date {
									xml.day artist.join_date.day
									xml.month artist.join_date.month
									xml.year artist.join_date.year
								}
							end
						}
					end

					band.albums.each do |album|
						xml.album(id: album.identification) {
							xml.title album.title
							if album.release_date.present?
								xml.release_date {
									xml.day album.release_date.day
									xml.month album.release_date.month
									xml.year album.release_date.year
								}
							end
							album.songs.each do |song|
								xml.song(id: song.identification, performedBy: song.album.band.identification) {
									xml.title song.title
									xml.ranking song.ranking if song.ranking.present?
								}
							end
						}
					end

					band.shows.each do |show|
						xml.show(id: show.identification, location: show.location.identification) {
							xml.title show.title
							if show.date.present?
								xml.date {
									xml.day show.date.day
									xml.month show.date.month
									xml.year show.date.year
								}
							end
							xml.performer(ref: show.band.identification)
						}
					end
				}
			end
		}
	end

	File.open(Rails.root.join('app/assets/xml/bandsWritten.xml'), "w") { |file| file.write builder.to_xml }
  end
end
