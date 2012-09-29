# Any live cell with fewer than two live neighbours dies, as if caused by under-population.
# Any live cell with two or three live neighbours lives on to the next generation.
# Any live cell with more than three live neighbours dies, as if by overcrowding.
# Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.

require_relative "../lib/life"


describe Zeus do
  let(:zeus) { Zeus.new }
  let(:soul) { Soul.new }

  it "has a world" do
    zeus.world.should be_empty
    zeus.world.should be_instance_of(Array)
  end

  it "allows to live when there are 2 neighbors" do
    soul.living_neighbors = 2
    zeus.add_to_world(soul)
    soul.should_not_receive(:die!)
    zeus.reap!
  end

  it "allows to live when there are 3 neighbors" do
    soul.living_neighbors = 3
    zeus.add_to_world(soul)
    soul.should_not_receive(:die!)
    zeus.reap!
  end

  it "kills when there is 1 neighbor" do
    soul.living_neighbors = 1
    zeus.add_to_world(soul)
    soul.should_receive(:die!)
    zeus.reap!
  end

  it "kills when there are 4 neighbors" do
    soul.living_neighbors = 4
    zeus.add_to_world(soul)
    soul.should_receive(:die!)
    zeus.reap!
  end

end

describe Soul do
  let(:soul) { Soul.new }

end
