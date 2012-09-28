# Any live cell with fewer than two live neighbours dies, as if caused by under-population.
# Any live cell with two or three live neighbours lives on to the next generation.
# Any live cell with more than three live neighbours dies, as if by overcrowding.
# Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.


require 'helper'

describe Cell do
  it 'knows if it is alive' do
    cell = Cell.new(:state => 'alive')
    cell.alive?.must_equal true
  end

  it "has a position" do
    position = Position.new(1,1)
    cell = Cell.new(:state => 'alive', :position => position)
    cell.position.must_equal position
  end

  it 'knows where it is on the horizontal and vertical plane' do
    position = Position.new(2,3)
    cell = Cell.new(:position => position)
    cell.x.must_equal 2
    cell.y.must_equal 3
  end

  # it 'knows how many neighbors it has' do
  #   cell = Cell.new(:state => 'alive')
  #   cell.neighbors_count.must_equal 0
  # end
end


describe Board do
  it "returns a cell at a given position" do
    position = Position.new(2,3)
    cell = Cell.new(:position => position)
    board = Board.new :positions => [position]
    board.find(position).must_equal cell
  end
end