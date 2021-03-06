# Any live cell with fewer than two live neighbours dies, as if caused by under-population.
# Any live cell with two or three live neighbours lives on to the next generation.
# Any live cell with more than three live neighbours dies, as if by overcrowding.
# Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.


require 'helper'

initial_world = [
  [0, 1, 0, 1, 1],
  [1, 1, 1, 1, 1],
  [0, 0, 0, 0, 0],
  [0, 1, 0, 1, 1],
  [1, 1, 0, 0, 1]
]

world_t1 = [
  [0, 0, 0, 0, 0],
  [0, 1, 0, 0, 0],
  [0, 0, 0, 0, 0],
  [0, 1, 1, 1, 1],
  [0, 1, 0, 0, 0]
]

describe World do
  before do
    @world = World.new(initial_world)
  end

  it "should require and record a beginning state" do
    lambda {World.new}.must_raise(ArgumentError)
    @world.export.must_equal initial_world
  end

  it "should correctly report the value at given coordinates" do
    @world[0,0].must_equal(0)
    @world[1,0].must_equal(1)
    @world[1,1].must_equal(1)
  end

  it "should wrap around the world" do
    @world[5,0].must_equal(0)
    @world[0,5].must_equal(0)
    @world[3,5].must_equal(1)
  end

  it "should correctly report the number of neighbors" do
    @world.neighbors(0,0).must_equal(8)
    @world.neighbors(0,4).must_equal(6)
    @world.neighbors(1,0).must_equal(5)
    @world.neighbors(1,1).must_equal(3)
    @world.neighbors(2,2).must_equal(5)
  end

end


describe God do
  before do
    @god = God.new(World.new(initial_world))
  end

  it "should have an initial time of zero" do
    @god.time.must_equal 0
  end

  it "should have a time greater than zero after iterating" do
    @god.iterate
    @god.time.must_be(:>, 0)
  end

  it "should have the correct state after 1 iteration" do
    @god.iterate
    @god.world.export.must_equal(world_t1)
  end

end