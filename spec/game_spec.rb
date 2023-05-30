require './lib/board'
require './lib/ship'
require './lib/cell'
require './lib/game'

RSpec.describe Game do
  before(:each) do
    @game = Game.new
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  it 'exist' do 
      expect(@game).to be_an_instance_of(Game)
  end 

  it "has a main menu" do 
    expect(@game.main_menu).to eq(puts "Welcome Mariner! To BATTLESHIP. Ready up.
      Enter p to head into the sea-fight. Enter q to head back to the bunks.")
  end
end 