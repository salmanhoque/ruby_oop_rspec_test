require File.expand_path('lib/interface.rb')

describe "InterfaceClass"  do 

  describe "launch method" do
  
   	before :each do
   	 	@a = Interface.new("movie.txt") 
   	end

   	context "should have a method to launch the app" do
   		it { @a.should respond_to :launch! }
   	end
   	
   	context "should call welcome_msg" do
   		it { 
   			obj = double()
			  obj.stub(:msg => "\n\n<<< WELCOME TO THE MOVIE APP >>>\n\n" )
        obj.stub(:msg).with(@a.welcome_msg)
   		}
   	end
   	
   	context "should have a goodbye method" do
   		it { 
   			obj = double
   			obj.stub(:gb_msg => "\n\n<<< GoodBye! >>>\n\n")
   			obj.stub(:gb_msg).with(@a.goodbye_msg)
   		 }
   	end

   	context "if user input is add" do
   		it { 
   			obj = double
   			obj.stub(:add => "adding...")
   			obj.stub(:add).with(@a.actions('add'))
   		}
    end

    context "if user input is finding" do
   		it { 
   			obj = double
   			obj.stub(:find => "finding...")
   			a = obj.stub(:find).with(@a.actions('find'))
   		}
    end
  end

  describe "listing movies" do
    before { @a = Interface.new("movie.txt") }

    context "if user input is listing" do
      it { 
        obj = double
        obj.stub(:list => "listing...")
        a = obj.stub(:list).with(@a.actions('list'))
      }
    end
  end
    
end