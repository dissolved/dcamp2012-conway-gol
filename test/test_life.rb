# Any live cell with fewer than two live neighbours dies, as if caused by under-population.
# Any live cell with two or three live neighbours lives on to the next generation.
# Any live cell with more than three live neighbours dies, as if by overcrowding.
# Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.


require 'helper'

class TestLife < MiniTest::Unit::TestCase
  def test_a_cell_has_coordinates
    c = Cell.new(4,3)
    assert_equal 4, c.x
    assert_equal 3, c.y
  end

  def test_a_lone_cell_has_a_neighbor_count_of_0
    c = Cell.new(4,3)
    w = World.new
    w.add(c)
    assert_equal 0, c.neighbor_count(w)
  end

  def test_a_cell_with_a_friend_has_a_neighbor_count_of_1
    c = Cell.new(0,0)
    c2 = Cell.new(0,1)
    world = World.new
    world.add(c)
    world.add(c2)
    assert_equal 1, c.neighbor_count(world)
    assert_equal 1, c2.neighbor_count(world)
  end

  def test_the_world_can_change
    w = World.new
    w.add Cell.new(0,0)
    w.add Cell.new(0,1)

    assert_equal 2, w.count
    w.iterate
    assert_equal 0, w.count
  end

  def test_the_world__can_create_new_life
    w = World.new
    w.add Cell.new(0,0)
    w.add Cell.new(0,1)
    w.add Cell.new(1,0)

    assert_equal 3, w.count
    w.iterate
    assert_equal 4, w.count
  end

  def test_a_cell_dies_with_less_than_two_or_more_than_three_neighbors
    c = Cell.new(4,3)
    assert c.dies?(1)
    assert c.dies?(0)
    refute c.dies?(2)
    refute c.dies?(3)
    assert c.dies?(4)
  end

end
