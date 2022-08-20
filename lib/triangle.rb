class Triangle
	attr_reader :side_a, :side_b, :side_c

	def initialize (side_a, side_b, side_c)
		@side_a = side_a
		@side_b = side_b
		@side_c = side_c
	end

	def kind
		check_triangle_validity
		if side_a == side_b && side_b == side_c
			:equilateral
		elsif side_a == side_b || side_b == side_c || side_a == side_c
			:isosceles
		else
			:scalene
		end
	end

	def sides_greater_than_zero?
    [side_a, side_b, side_c].all?(&:positive?)
  end

	def valid_triangle?
		side_a + side_b > side_c && side_a + side_c > side_b && side_b + side_c > side_a
	end



	def check_triangle_validity
		raise TriangleError unless sides_greater_than_zero? && valid_triangle?
	end

	class TriangleError < StandardError
		def message
			"Triangle size cannot be zero"
		end
	end
	
end