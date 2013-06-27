require 'store'

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
		puts "adding..."
	end

	def list
		puts "linting..."
	end

	def find
		puts "finding..."
	end

	def welcome_msg
		puts "\n\n<<< WELCOME TO THE MOVIE APP >>>\n\n"
	end

	def goodbye_msg
		puts "\n\n<<< GoodBye! >>>\n\n"
	end

end