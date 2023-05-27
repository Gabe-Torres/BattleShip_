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

  def valid_placement?(ship, coordinate)
    if coordinate.length != ship.length
      false
    end
  end
end