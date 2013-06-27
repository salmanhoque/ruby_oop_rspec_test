require File.expand_path('lib/movie.rb')
require File.expand_path('lib/store.rb')

describe "#MovieClass" do 

	describe "initilizing the movie class" do
		before :each do
			@a = Movie.new("Super Man",2013,8.5)
		end

		context "its a movie instance" do
			it { @a.should be_an_instance_of Movie }
		end

		context "its should have movie_name, release_date and rating attribute" do
			it { @a.should respond_to :movie_name, :release_date, :rating}
		end
	end	

	describe "Should able to store data into file" do
		before :each do
			@a = Movie.new("Super Man",2013,8.5)
			Store.set_file = 'movie.txt'
		end

		context "by using add_movie method" do
			it { @a.add_movie.should be_true }
		end
	end

	describe "Should able to restore data from file" do
		before :each do
			Store.set_file = 'movie.txt'
		end

		context "by using get_all_movies method" do
			it { Movie.get_all_movies.should be_kind_of(Array) }
		end
	end


end

