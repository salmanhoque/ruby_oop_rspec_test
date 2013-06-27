class Store

	@@file = nil
	
	def self.set_file=(file)
		@@file = file
	end

	def self.file_exist?
		if @@file && File.exist?(@@file) 
			return true
		else @@file = nil
			return false
		end  
	end

	def self.create_file(file)
		return true
	end
end