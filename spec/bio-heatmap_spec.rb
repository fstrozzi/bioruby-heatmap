require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
data_path = File.expand_path File.dirname(__FILE__)+"/data"

describe BioHeatChart do
	before(:all) do
		@heatchart = BioHeatChart.new([[1,2,3,4],[5,6,7,8]]) 
	end

		it "should create an object of class org.tc33.jheatchart.HeatChart from a standard Ruby array of arrays" do
			@heatchart.class.should == BioHeatChart
			@heatchart.jheatchart.class.should == org.tc33.jheatchart.HeatChart
		end

	describe "BioHeatChart#save_to_file" do

		it "should create an image from a simple matrix" do
			@heatchart.save_to_file(data_path+"/matrix_image.jpg")
		end

	end

	describe "BioHeatChart#set_title" do
		it "should add a title to the image" do
			@heatchart.set_title("Spec Matrix")
			@heatchart.get_title.should == "Spec Matrix"
		end
	end

	describe "BioHeatChart#data_colors" do

		it "set the low and high colors of the heatchart data" do
			@heatchart.data_colors({:low => "red", :high => "green"})
			@heatchart.jheatchart.get_low_value_colour.to_string.should == "java.awt.Color[r=255,g=0,b=0]"
			@heatchart.jheatchart.get_high_value_colour.to_string.should == "java.awt.Color[r=0,g=255,b=0]"
			@heatchart.save_to_file(data_path+"/matrix_image_colors.png")
		end
	end


end




