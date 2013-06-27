class Store

	@@file = nil
	
	def self.set_file=(file)
		@@file = file
	end

	def self.file_exist?
		if @@file && File.exist?(@@file) 
			return true
		else 
			return false
		end  
	end

	def self.usable?
		return false unless @@file
		return false unless File.exist?(@@file)
		return false unless File.writable?(@@file)
		return false unless File.readable?(@@file)
		return true
	end

	def self.create_file(file)
		File.open(@@file, 'w')
		return true
	end

	def self.add_into_file(array)
		return false unless self.usable?
		File.open(@@file, 'a') do |file|
			array.each do |i|
				file.print "#{i}\t"
			end
			file.puts
		end
		return true
	end
end