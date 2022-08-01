class Triangle
  attr_reader :side_one, :side_two, :side_three

  def initialize(side_one, side_two, side_three)
    if side_one > 0 && side_two > 0 && side_three > 0
      @side_one = side_one
      @side_two = side_two
      @side_three = side_three
    else
      raise TriangleError
    end
  end

  def kind
    inequality_one = (@side_two + @side_three) <= @side_one
    inequality_two = (@side_one + @side_three) <= @side_two
    inequality_three = (@side_one + @side_two) <= @side_three

    if (inequality_one || inequality_two || inequality_three)
      raise TriangleError
    elsif @side_one == @side_two && @side_one == @side_three
      :equilateral
    elsif @side_one == @side_two || @side_one == @side_three || @side_two == @side_three
      :isosceles
    else
      :scalene
    end
  end

  class TriangleError < StandardError
    "Ths is not a triangle. The sum of the lengths of any two sides
    of a triangle always exceeds the length of the third side."
  end

end
