require './lib/board'
require './lib/ship'
require './lib/cell'
require './lib/game'

RSpec.describe Game do
  before(:each) do
    @game = Game.new
    @player_board = Board.new
    @computer_board = Board.new
    @player_cruiser = Ship.new("Cruiser", 3)
    @player_submarine = Ship.new("Submarine", 2)
    @computer_cruiser = Ship.new("Cruiser", 3)
    @computer_submarine = Ship.new("Submarine", 2)
  end

  it 'exist' do 
      expect(@game).to be_an_instance_of(Game)
  end

  it 'has ships' do
    expect(@player_cruiser).to be_a(Ship)
    expect(@player_submarine).to be_a(Ship)
    expect(@computer_cruiser).to be_a(Ship)
    expect(@computer_submarine).to be_a(Ship)
  end

  it "has boards" do
    expect(@player_board).to be_a(Board)
    expect(@computer_board).to be_an_instance_of(Board)
  end

  it "sinks the ships" do
    @player_cruiser.hit
    @player_cruiser.hit
    @player_cruiser.hit
    @player_submarine.hit
    @player_submarine.hit
    expect(@player_cruiser.sunk?).to eq(true)
    expect(@player_submarine.sunk?).to eq(true)
  end

 
end 