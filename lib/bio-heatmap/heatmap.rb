class BioHeatChart

	attr_reader :jheatchart
	def initialize(expression_matrix)
			@jheatchart = org.tc33.jheatchart.HeatChart.new(expression_matrix.to_java(Java::double[]))		
	end

	def save_to_file(filename)
		@jheatchart.save_to_file java.io.File.new(filename)
	end
	
	def data_colors(colors)
		@jheatchart.set_high_value_colour(java.awt.Color.method(colors[:high]).call)
		@jheatchart.set_low_value_colour(java.awt.Color.method(colors[:low]).call)
	end


	def method_missing(name, *args, &block)
			@jheatchart.method(name).call(*args)
	end


end
