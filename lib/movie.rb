require 'store'

class Movie

	def self.get_all_movies
		movies = Store.get_data_from_file
		movies_array = []
	
		for movie in movies 
			movie_name, release_date, rating = movie
			movies_array << Movie.new(movie_name, release_date, rating)
		end

		return movies_array
	end

	def self.add_movie(movie)
		if Store.add_into_file(movie) 
			return true
		else
			return false
		end				
	end

	attr_accessor :movie_name, :release_date, :rating

	def initialize(movie_name,release_date,rating)
		@movie_name    = movie_name
		@release_date  = release_date
		@rating 	   = rating		
	end

end