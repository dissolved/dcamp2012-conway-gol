# Any live cell with fewer than two live neighbours dies, as if caused by under-population.
# Any live cell with two or three live neighbours lives on to the next generation.
# Any live cell with more than three live neighbours dies, as if by overcrowding.
# Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.


require 'helper'

class TestLife < MiniTest::Unit::TestCase
  def test_something_for_real
    flunk "hey buddy, you should probably start testing for real"
  end
end
