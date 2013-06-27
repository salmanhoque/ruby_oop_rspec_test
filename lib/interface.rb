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
			action, user_args = user_action
			result = actions(action, user_args)
		end			
		
		goodbye_msg
	end

	def user_action
		print "> " 
		user_args = gets.chomp.downcase.split(' ')
		action    = user_args.shift
		return action, user_args
	end

	def actions(action, user_args)
		case action
		when 'add'
			add_movie
		when 'list'
			list(user_args)
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

	def list(user_args)
		movies       = Movie.get_all_movies
		sort_order   = user_args.shift
		sort_order   = user_args.shift if sort_order == 'by'
		sort_order   = "name" unless ['name', 'date', 'rating'].include?(sort_order)

		puts "\n\n Movie List \n\n"
		puts "Try using list by name, list by rating or list by date"

		movies.sort! do |m1,m2|
			case sort_order
			when 'name'
				m1.movie_name.downcase <=> m2.movie_name.downcase
			when 'date'
				m1.release_date.to_i <=> m2.release_date.to_i
			when 'rating'
				m1.rating.to_i <=> m2.rating.to_i
			end
		end
		
		output_movie_table(movies)	
	end

	def find(user_args) 
		puts user_args
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