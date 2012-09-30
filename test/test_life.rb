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
  it "should require and record a beginning state" do
    lambda {World.new}.must_raise(ArgumentError)
    world = World.new(initial_world)
    world.export.must_be_same_as initial_world
  end

  it "should have an initial time of zero" do
    world = World.new(initial_world)
    world.time.must_equal 0
  end

  it "should have a time greater than zero after iterating" do
    world = World.new(initial_world)
    world.iterate
    world.time.must_be(:>, 0)
  end
  
  it "should correctly report the number of neighbors" do
    world = World.new(initial_world)
    world.neighbors(0,0).must_equal(8)
    world.neighbors(1,1).must_equal(3)
    world.neighbors(2,2).must_equal(5)
  end
  
  
  # it "should have the correct state after 1 iteration" do
  #   pending
  #   world = World.new(initial_world)
  #   world.iterate
  #   world.export.must_equal(world_t1)
  # end
end