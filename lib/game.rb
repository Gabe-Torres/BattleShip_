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
      turn
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
      player_place_cruiser
      player_place_sub
      puts "Ships have been placed!"
    end
    
    def computer_place_ships
      random_cruiser_coordinates = @computer_board.cells.keys.sample(3)
      until @computer_board.valid_placement?(@computer_cruiser, random_cruiser_coordinates)
        random_cruiser_coordinates = @computer_board.cells.keys.sample(3)
      end
        @computer_board.place(@computer_cruiser, random_cruiser_coordinates)
        random_sub_coordinates = @computer_board.cells.keys.sample(2)
      until @computer_board.valid_placement?(@computer_submarine, random_sub_coordinates)
          random_sub_coordinates = @computer_board.cells.keys.sample(2)
      end
      @computer_board.place(@computer_submarine, random_sub_coordinates)
    end
    
    def  player_place_cruiser
      puts "Enter the squares for the Cruiser (3 spaces):"
      cruiser_coordinate = gets.chomp.upcase.split
      if @player_board.valid_placement?(@player_cruiser, cruiser_coordinate) == true
        @player_board.place(@player_cruiser, cruiser_coordinate)
      else
        puts "Invalid coordinates!"
        player_place_cruiser
      end
    end

    def player_place_sub
        puts "Enter the squares for the Submarine (2 spaces):"
        submarine_coordinate = gets.chomp.upcase.split
        if @player_board.valid_placement?(@player_submarine, submarine_coordinate) == true
          @player_board.place(@player_submarine, submarine_coordinate)
        else
          puts "Invalid coordinates!"
          player_place_sub
        end
    end

    def turn
      display_boards
      puts "Fire when ready!!!"
      shot_coordinate = gets.chomp.upcase
      @computer_board.cells[shot_coordinate].fire_upon
      puts @computer_board.render

    end

    def display_boards
      puts "=============COMPUTER BOARD============="
      puts @computer_board.render
      puts "==============PLAYER BOARD=============="
      puts @player_board.render(true)
    end
  end
    
  #   def player_turn
  #     puts "Enter coordinates to fire upon"
  #     coordinate = gets.chomp.upcase
      
  #     result = @computer_board.fire_upon(coordinate)

  # end
  
  
  # def play_game
  #   loop do
  #     display_boards

  #     player_turn
  #     break if game_over?

  #     computer_turn
  #     break if game_over?
  #   end

  #   display_boards
  #   announce_winner
  #   play_again?
  # end

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