class Game #have to make runner file 
  def initialize
    @player_cruiser = Ship.new("Cruiser", 3)
    @player_submarine = Ship.new("Submarine", 2)
    @computer_cruiser = Ship.new("Cruiser", 3)
    @computer_submarine = Ship.new("Submarine", 2)
    @computer_board = Board.new 
    @player_board = Board.new
  end
    
  def main_menu
    puts "Welcome Mariner! To BATTLESHIP. Ready up.
    Enter p to head into the sea-fight. Enter q to head back to the bunks."
    
    choice = gets.chomp.downcase
    if choice == "p"
      setup_game
      play_game
    elsif choice == "q"
      puts "Thanks for playing!"
      exit
    else
      puts "Invalid choice. Please try again."
      main_menu
    end
  end

    def setup_game
      computer_place_ships
      puts "I have laid out my ships on the grid.
      You now need to lay out your two ships.
      The Cruiser is three units long and the Submarine is two units long.
        1 2 3 4
      A . . . .
      B . . . .
      C . . . .
      D . . . . "
      player_place_ships
    end
    
    def computer_place_ships

    end
    
    def  player_place_ships
      puts "Enter the squares for the Cruiser (3 spaces):"
      cruiser_coordinate = gets.chomp.upcase.split
      @player_board.place(@player_cruiser, cruiser_coordinate)
      puts "Enter the squares for the Submarine (2 spaces):"
      submarine_coordinate = gets.chomp.upcase.split
      @player_board.place(@player_submarine, submarine_coordinate)
      puts "Ships have been placed!"

      # add valid placement
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

    def render(show_ship = false)
      return "X" if ship && ship.sunk?
      return "H" if fired_upon? && ship
      return "M" if fired_upon?
      return "S" if show_ship && ship
      "."
    end
    
    def player_turn
      puts "Enter coordinates to fire upon"
      coordinate = gets.chomp.upcase

      result = @computer_board.fire_upon(coordinate)
    end

    def fire_upon(coordinate)
      @fired_upon = true
      if @ship
        @ship.hit
      end
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