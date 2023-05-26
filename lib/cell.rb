class Cell
  attr_reader :coordinate,
              :ship
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
  end

  def empty?
    if @ship == nil 
      true
    else 
      false
    end
  end

  def place_ship(ship)
    @ship = ship 
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    @fired_upon = true
    if @ship
      @ship.hit
    end
  end

  def render(show_ship = false)
    return "X" if ship && ship.sunk?
    return "H" if fired_upon? && ship
    return "M" if fired_upon?
    return "S" if show_ship && ship
    "."
  end
end