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
    expect(@game.main_menu).to eq(puts "string")
  end

  it "sets up game" do 

  end

  it "places player ships" do 

  end

  it "places computer ships" do 

  end 
end 