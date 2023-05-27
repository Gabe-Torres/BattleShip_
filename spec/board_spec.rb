require './lib/board'
require './lib/ship'
require './lib/cell'

RSpec.describe Board do
  before(:each) do
    @board = Board.new 
  end

  it 'exists' do 
    expect(@board).to be_an_instance_of(Board)
  end
  
  it 'has cells' do
    expected_data = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]
    expect(@board.cells.keys).to eq(expected_data)
  end
end 
