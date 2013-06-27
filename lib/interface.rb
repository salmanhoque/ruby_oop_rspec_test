require 'store'
require 'movie'

class Interface

	def initialize(path=nil)
		Store.set_file = path 
		if Store.usable?
			puts "Found your file"
		elsif 
			Store.create_file(path)
			puts "File Created"
		else
			puts "File Error! Exiting...."
			exit!
		end

	end

	def launch!
		welcome_msg

		result = nil
		until result == :quit
			action = user_action
			result = actions(action)
		end			
		
		goodbye_msg
	end

	def user_action
		print "> " 
		action = gets.chomp
		return action
	end

	def actions(action=nil)
		case action
		when 'add'
			add_movie
		when 'list'
			list	
		when 'find'
			find 
		when 'quit'
			return :quit			
		end
	end

	def add_movie
		args = []

		puts "Enter movie name:"
		args << gets.chomp
		puts "Enter movie release_date:"
		args << gets.chomp
		puts "Enter movie rating:"
		args << gets.chomp

		if Movie.add_movie(args) 
			puts "Your movie has been added" 
		else 
			puts "File Error!"
		end
	end

	def list
		movies = Movie.get_all_movies
		output_movie_table(movies)	
	end

	def find
		puts "finding..."
	end

	def welcome_msg
		puts "\n\n<<< WELCOME TO THE MOVIE APP >>>"
		puts "\n\nUse add, list, find and sort to interact with this app\n\n"
	end

	def goodbye_msg
		puts "\n\n<<< GoodBye! >>>\n\n"
	end

	private
	def output_movie_table(movies = [])
		print " " + "Movie Name".ljust(30)		
		print " " + "Release Date".ljust(20)		
		print " " + "Rating".rjust(6) + "\n"
		puts "-"*60

		movies.each do |movie|
			line  = " " << movie.movie_name.ljust(30)
			line << " " << movie.release_date.ljust(20)
			line << " " << movie.rating.rjust(6)
			puts line
		end		

		puts "No Restaurant Found" if movies.empty?
		puts "-"*60
	end
end