class Board
  attr_reader :cells,
              :existing_coordinates
  def initialize
    @cells = make_cells
    @existing_coordinates = []
  end

  def make_cells
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
    !overlap?(coordinates) && 
    coordinates.length == ship.length && 
    consecutive_coordinates?(coordinates) && 
    !diagonal_coordinates?(coordinates)
  end

  def consecutive_coordinates?(coordinates)
    letters = coordinates.map do |coordinate| 
      coordinate[0].ord 
    end
    numbers = coordinates.map do |coordinate| 
      coordinate[1..-1].to_i 
    end

    consecutive_letters = letters.each_cons(2).all? { |a, i| i == a + 1 }
    consecutive_numbers = numbers.each_cons(2).all? { |a, i| i == a + 1 }

    consecutive_letters || consecutive_numbers
  end
  
  def diagonal_coordinates?(coordinates)
    letters = coordinates.map { |coordinate| coordinate[0].ord }
    numbers = coordinates.map { |coordinate| coordinate[1..-1].to_i }

    letters.uniq.length > 1 && numbers.uniq.length > 1
  end

  def place(ship, coordinates)
    @existing_coordinates += coordinates
    coordinates.each do |coordinate|
      @cells[coordinate].place_ship(ship)
    end
  end
  

  def overlap?(coordinates)
    coordinates.any? do |coord|
      @existing_coordinates.include?(coord)
    end
  end

  def render(show_ship = false)
    rendered_board = "  1 2 3 4 \n"
    ("A".."D").each do |letter|
      row = "#{letter} "
      (1..4).each do |num|
        coordinate = "#{letter}#{num}"
        cell = @cells[coordinate]
        row += cell.render(show_ship) + " "
      end
      rendered_board += row.strip + " \n"
    end
    rendered_board
  end
end