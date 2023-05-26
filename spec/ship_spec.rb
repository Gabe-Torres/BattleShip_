require './lib/ship'

RSpec.describe Ship do
  before(:each) do
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  it 'exists' do
    expect(@cruiser).to be_an_instance_of(Ship)
    expect(@submarine).to be_an_instance_of(Ship)
  end
  
end