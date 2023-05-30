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

  it 'has attributes' do
    expect(@cruiser.name).to eq("Cruiser")
    expect(@submarine.name).to eq("Submarine")
    expect(@cruiser.length).to eq(3)
    expect(@submarine.length).to eq(2)
  end

  it 'has health' do
    expect(@cruiser.health).to eq(3)
    expect(@submarine.health).to eq(2)
  end

  it 'can sink' do
    expect(@cruiser.sunk?).to eq(false)
    expect(@submarine.sunk?).to eq(false)
  end

  it 'can lose health when hit' do
    @cruiser.hit
    @submarine.hit

    expect(@cruiser.health).to eq(2)
    expect(@submarine.health).to eq(1)

    @cruiser.hit
    @submarine.hit

    expect(@cruiser.health).to eq(1)
    expect(@submarine.health).to eq(0)
  end

  it 'can sink if health is 0' do
    @cruiser.hit
    @submarine.hit

    expect(@cruiser.sunk?).to eq(false)
    expect(@submarine.sunk?).to eq(false)

    @cruiser.hit
    @cruiser.hit
    @submarine.hit

    expect(@submarine.sunk?).to eq(true)
    expect(@cruiser.sunk?).to eq(true)
  end
end