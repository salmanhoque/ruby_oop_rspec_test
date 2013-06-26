require File.expand_path('lib/interface.rb')

describe "InterfaceClass"  do 

   	before :each do
   	 	@a = Interface.new 
   	end

   	context "should have a method to launch the app" do
   		it { @a.should respond_to :launch! }
   	end

   	
   	context "launch method should call welcome_msg" do
   		it { 
   			obj = double()
			obj.stub(:msg => "Welcome" )
			obj.stub(:msg).with("Welcome")
   		}
   	end
   	
   	

end