class Game #have to make runner file 
  def initialize
    @ships = [@cruiser, @submarine]
    @board = Board.new 
  end
    
  def main_menu
    puts "Welcome Mariner! To BATTLESHIP. Ready up.
    Enter p to head into the sea-fight. Enter q to head back to the bunks."
  end

  def play
    main_menu
    player_place_ships 
    cpu_place_ships
    display_board
    take_turn
    results
    end_game
  end
end

  #main menu
    # return to screen once game ends -method for restarting the game, should this be place beginning or end?
    # puts welcome statement?? - then put welcome statement?
  # computer places ships then player places ship & puts another statement showing how to play - method for computer to pick ships
    # when player places a valid it should appear on the board, another puts statement - method for player to pick ships
    # then they should place they're other ship, only allow for cruiser and submarine, ask for placements specifically
    # after entering an incorrect position they should be prompted to try again until a correct placement is selected