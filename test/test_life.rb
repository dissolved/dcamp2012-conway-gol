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
end