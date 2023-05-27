require './lib/board'
require './lib/ship'
require './lib/cell'

RSpec.describe Board do
  before(:each) do
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  it 'exists' do 
    expect(@board).to be_an_instance_of(Board)
  end
  
  it 'has cells' do
    expected_data = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]
    expect(@board.cells.keys).to eq(expected_data)
  end

  it "validates coordinate" do 
    expect(@board.valid_coordinate?("A1")).to eq(true)
    expect(@board.valid_coordinate?("D4")).to eq(true)
    expect(@board.valid_coordinate?("A5")).to eq(false)
    expect(@board.valid_coordinate?("E1")).to eq(false)
    expect(@board.valid_coordinate?("A22")).to eq(false)
  end

  it "validates ship placement accorgin to length" do
    expect(@board.valid_placement?(@cruiser, ["A1", "A2"])).to eq(false)
    expect(@board.valid_placement?(@submarine, ["A2", "A3", "A4"])).to eq(false)
  end

  it "validates that coordinates are consecutive" do
    expect(@board.valid_placement?(@cruiser, ["A1", "A2", "A4"])).to eq(false)
    expect(@board.valid_placement?(@submarine, ["A1", "C1"])).to eq(false)
    expect(@board.valid_placement?(@cruiser, ["A3", "A2", "A1"])).to eq(false)
    expect(@board.valid_placement?(@submarine, ["C1", "B1"])).to eq(false)
  end
  
end 
