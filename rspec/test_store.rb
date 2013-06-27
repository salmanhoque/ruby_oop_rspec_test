require File.expand_path('lib/store.rb')


describe "Store" do
	
	describe "file exist" do
		before  { Store.set_file = "movie_list.txt" }
		
		context "should return true" do
			it { Store.file_exist?.should be_true }
		end 	
	end	


	describe "file not exist" do	
		before  { Store.set_file = "movie.txt" }

		context "should return false" do		
			it {Store.file_exist?.should be_false}
		end
	end

	describe "should create file if not exist" do
		context "return ture after creating" do		
			it {Store.create_file("movie.txt").should be_true}
		end

		
	end

end 
	

