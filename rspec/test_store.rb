require File.expand_path('lib/store.rb')


describe "Store" do
	
	describe "file exist" do
		before  { Store.set_file = "movie_list.txt" }
		
		context "should return true" do
			it { Store.file_exist?.should be_true }
		end 	
	end	


	describe "file not exist" do	
		before  { Store.set_file = "movieeee.txt" }

		context "should return false" do		
			it {Store.file_exist?.should be_false}
		end
	end

	describe "should create file if not exist" do
		before {Store.set_file = "movie.txt"}
		context "return ture after creating" do		
			it {Store.create_file("movie.txt").should be_true}
		end
	end

	describe "a file should be usable" do
		before { Store.set_file = "movie.txt" }
		it { Store.usable?.should be_true }
	end

	describe "should able to write into a file" do
	
		context "frist data" do
			before { Store.set_file = 'movie.txt'}
			let(:data) { ['Iron Man3', 2013, 8.5] }
			it { Store.add_into_file(data).should be_true }
		end

		context "second data" do
			let(:data) { ['Sherlock holmes', 2013, 8.5] }
			it { Store.add_into_file(data).should be_true }
		end
	end

	describe "should able get data from file" do
		before { Store.set_file = 'movie.txt'}	
		context "file data" do
			it { Store.get_data_from_file.should be_kind_of(Array) }
		end

	end


end 
	

