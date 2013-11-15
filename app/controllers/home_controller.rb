require 'nokogiri'

class HomeController < ApplicationController
	def index
		xsd = Nokogiri::XML::Schema(File.read(Rails.root.join('app/assets/xml/bands.xsd')))
		doc = Nokogiri::XML(File.read(Rails.root.join('app/assets/xml/bands.xml')))
		contains_errors = false
		@errors = []
		xsd.validate(doc).each do |error|
			@errors << error
			contains_errors = true
		end

		if !contains_errors
			locations = doc.search('location')
			locations.each do |location|
				current_location = Location.find_or_create_by_identification(location.at_xpath('@id').text)
				current_location.update_attributes(
					venue: location.at_xpath('venue').text,
					street_address: location.at_xpath('streetAddress').text,
					city: location.at_xpath('city').text,
					country: location.at_xpath('country').text,
					continent: location.at_xpath('continent').text
				)
			end

			genres = doc.search('genre')
			genres.each do |genre|
				current_genre = Genre.find_or_create_by_identification(genre.at_xpath('@id').text)
				current_genre.update_attributes(title: genre.at_xpath('@title').text)
				description = genre.at_xpath('description')
				current_genre.update_attributes(description: description.text.delete("\n").delete("\t")) if description.present?
			end

		    bands = doc.search('band')
		    bands.each do |band|
		    	current_band = Band.find_or_create_by_identification(band.at_xpath('@id').text)
		    	current_band.update_attributes(genre: Genre.find_by_identification(band.at_xpath('@genre').text), name: band.at_xpath('name').text)
		    	description = band.at_xpath('description')
				current_band.update_attributes(description: description.text.delete("\n").delete("\t")) if description.present?

		    	artists = band.search('artist')
		    	artists.each do |artist|
		    		current_artist = current_band.artists.find_or_create_by_identification(artist.at_xpath('@id').text)
		    		current_artist.update_attributes(
		    			name: artist.at_xpath('name').text, 
		    			biography: artist.at_xpath('biography').text.delete("\n").delete("\t"), 
		    			role: artist.at_xpath('role').text, 
		    			birthday: DateTime.new(
		    				Integer(artist.at_xpath('birthday/year').text), 
		    				Integer(artist.at_xpath('birthday/month').text), 
		    				Integer(artist.at_xpath('birthday/day').text)
		    			),
		    			join_date: DateTime.new(
		    				Integer(artist.at_xpath('join-date/year').text), 
		    				Integer(artist.at_xpath('join-date/month').text), 
		    				Integer(artist.at_xpath('join-date/day').text)
		    			)
		    		)
		    	end

		    	albums = band.search('album')
		    	albums.each do |album|
		    		current_album = current_band.albums.find_or_create_by_identification(album.at_xpath('@id').text)
		    		current_album.update_attributes(
		    			title: album.at_xpath('title').text, 
		    			release_date: DateTime.new(
		    				Integer(album.at_xpath('releaseDate/year').text), 
		    				Integer(album.at_xpath('releaseDate/month').text), 
		    				Integer(album.at_xpath('releaseDate/day').text)
		    			)
		    		)
		    		songs = album.search('song')
		    		songs.each do |song|
		    			current_song = current_album.songs.find_or_create_by_identification(song.at_xpath('@id').text)
		   				current_song.update_attributes(
		   					title: song.at_xpath('title').text,
		   					ranking: song.at_xpath('ranking').text
	    				)
		    		end
		    	end

		    	shows = band.search('show')
		    	shows.each do |show|
		    		current_show = current_band.shows.find_or_create_by_identification(show.at_xpath('@id').text)
		    		current_show.update_attributes(
		    			title: show.at_xpath('title').text,
		    			location_id: Location.find_by_identification(show.at_xpath('@location').text).id,
		    			date: DateTime.new(
		    				Integer(show.at_xpath('date/year').text), 
		    				Integer(show.at_xpath('date/month').text), 
		    				Integer(show.at_xpath('date/day').text)
		    			)
		    		)
		    	end
		    end

			redirect_to bands_path
		end
	end
end
