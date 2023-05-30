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
      expect(@board).to be_an_instance_of(Board)
  end
end 