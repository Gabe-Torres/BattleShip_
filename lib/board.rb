class Board
  attr_reader :cells

  def initialize
    @cells = cells
  end

  def cells
    cells = {}
    ("A".."D").each do |letter|
      (1..4).each do |num|
        coordinate = "#{letter}#{num}"
        cells[coordinate] = Cell.new(coordinate)
      end
    end
    cells
  end

  def valid_coordinate?(coordinate)
    cells.key?(coordinate)
  end

  def valid_placement?(ship, coordinates)
    if coordinates.length != ship.length
      false
    elsif consecutive_coordinates?(coordinates)
      false
    elsif diagonal_coordinates?(coordinates)
      false
    else
      true
    end
  end

  def consecutive_coordinates?(coordinates)
    letters = coordinates.map { |coordinate| coordinate[0].ord }
    numbers = coordinates.map { |coordinate| coordinate[1..-1].to_i }

    consecutive_letters = letters.each_cons(2).all? { |a, i| i == a + 1 }
    consecutive_numbers = numbers.each_cons(2).all? { |a, i| i == a + 1 }

    !consecutive_letters && !consecutive_numbers
  end
  
  def diagonal_coordinates?(coordinates)
    letters = coordinates.map { |coordinate| coordinate[0].ord }
    numbers = coordinates.map { |coordinate| coordinate[1..-1].to_i }

    letters.uniq.length > 1 && numbers.uniq.length > 1
  end

end