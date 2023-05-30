class Game #have to make runner file 
  def initialize
    @player_ships = []
    @computer_ships = []
    @computer_board = Board.new 
    @player_board = Board.new
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
  end

    def start_game
      puts "I have laid out my ships on the grid.
      You now need to lay out your two ships.
      The Cruiser is three units long and the Submarine is two units long.
        1 2 3 4
      A . . . .
      B . . . .
      C . . . .
      D . . . . "
      play_game 
    end

    def play_game
      loop do
        display_boards
  
        player_turn
        break if game_over?
  
        computer_turn
        break if game_over?
      end
  
      display_boards
      announce_winner
      play_again?
    end
    def display_boards
      puts "=============COMPUTER BOARD============="
      puts @computer_board.render
      puts "==============PLAYER BOARD=============="
      puts @player_board.render(true)
    end
  end
  

    # def setup_board 
    #   @ships.each do |ship|
    #     # puts "Placed Ships"
    #     @board.render(true)
    #     puts 'Enter Coordinates'
    #     coordinates = gets.chomp
    #     @board.place(ship, coordinates)
    #   end
    #     puts "Ships have been placed"
    # end





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

  #main menu
    # return to screen once game ends -method for restarting the game, should this be place beginning or end?
    # puts welcome statement?? - then put welcome statement?
  # computer places ships then player places ship & puts another statement showing how to play - method for computer to pick ships
    # when player places a valid it should appear on the board, another puts statement - method for player to pick ships
    # then they should place they're other ship, only allow for cruiser and submarine, ask for placements specifically
    # after entering an incorrect position they should be prompted to try again until a correct placement is selected