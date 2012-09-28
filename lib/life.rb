class World
  include Enumerable
  def initialize
    @cells = []
  end

  def add(cell)
    @cells << cell
  end

  def each
    @cells.each{|c| yield c}
  end

  def iterate
    cells_to_kill = []
    puts "Iterate over #{count} cells"
    each do |cell|
      puts "process #{cell}"
      if cell.neighbor_count(self) >= 2
        puts "find life"
        [-1,0,1].each do |x|
          [-1,0,1].each do |y|
            c = Cell.new(x,y)
            unless @cells.find{|existing| existing.x == x && existing.y == y }
              add(c) if c.neighbor_count(self) == 3
            end
          end
        end
      else
        puts 'kill'
        cells_to_kill cell
      end
    end
    cells_to_kill.each{|c| @cells.delete c}
  end

end

class Cell
  attr_reader :x, :y

  def initialize(x,y)
    @x = x
    @y = y
  end

  def neighbor_count(world)
    world.count do |cell|
      (cell.x-x).abs <= 1 && (cell.y-y).abs <=1 && cell != self
    end
  end

  def dies?(neighbors)
    ![2,3].include?(neighbors)
  end

end