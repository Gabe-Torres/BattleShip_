class Game #have to make runner file 
  def initialize
    @ships = [@cruiser, @submarine]
    @board = Board.new 
  end
    
  def main_menu
    puts "Welcome Mariner! To BATTLESHIP. Ready up.
    Enter p to head into the sea-fight. Enter q to head back to the bunks."
    choice = gets.chomp.downcase 
  
    case choice 
    when "p"
      start_game
    when "q"
      end_game
    else 
      puts "Invalid choice. Please enter p or q."
  end
    # puts "I have laid out my ships on the grid.
    # You now need to lay out your two ships.
    # The Cruiser is three units long and the Submarine is two units long.
    #   1 2 3 4
    # A . . . .
    # B . . . .
    # C . . . .
    # D . . . . "
    
  end

  # def play
  #   main_menu
  #   start_game
  #   player_place_ships 
  #   cpu_place_ships
  #   display_board
  #   take_turn
  #   results
  #   end_game
  # end
end

  #main menu
    # return to screen once game ends -method for restarting the game, should this be place beginning or end?
    # puts welcome statement?? - then put welcome statement?
  # computer places ships then player places ship & puts another statement showing how to play - method for computer to pick ships
    # when player places a valid it should appear on the board, another puts statement - method for player to pick ships
    # then they should place they're other ship, only allow for cruiser and submarine, ask for placements specifically
    # after entering an incorrect position they should be prompted to try again until a correct placement is selected