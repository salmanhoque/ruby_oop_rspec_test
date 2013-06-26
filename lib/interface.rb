class Interface

	def initialize(path=nil)
		
	end

	def launch!
		welcome_msg
		loop  unless action == :quit
			action = user_action
		end			
		goodbye_msg
	end

	def user_action
		print "> " 
		user_action = gets.chomp.strip	
		return user_action
	end

	def actions(action=nil)
		case action
		when 'add'
			add_movie
		when 'list'
			list	
		when 'find'
			find	
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