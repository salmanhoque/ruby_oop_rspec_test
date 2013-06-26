class Interface

	def initialize(path=nil)
		
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