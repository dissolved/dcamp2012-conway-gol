class World
  attr_reader :width, :height

  def initialize state
    @state = Marshal.load(Marshal.dump(state))
    @height = @state.size
    @width = @state[0].size
  end

  def export
    @state
  end

  def to_s
    @state.inspect.gsub("], ", "],\n ")
  end

  def [](x,y)
    @state[y % @height][x % @width]
  end

  def dup
    Marshal.load(Marshal.dump(self))
  end

  def []=(x,y,value)
    @state[y % @height][x % @width] = value
  end

  def alive?(x,y)
    self[x,y] != 0
  end

  def neighbors(x,y)
    count = 0
    [-1, 0, 1].each do |dx|
      [-1, 0, 1].each do |dy|
        count += 1 if alive?(x + dx, y + dy) and not (dx == 0 and dy == 0)
      end
    end
    count
  end

end


class God
  attr_reader :time
  attr_reader :world

  def initialize(world)
    @time = 0
    @world = world.dup
  end

  def iterate
    @time += 1
    @world = calculate_world
  end

  def fate(x,y)
    case @world.neighbors(x,y)
    when 0..1 then 0
    when 2 then @world[x,y]
    when 3 then 1
    when 4..8 then 0
    end
  end

  protected

  def calculate_world
    @world.dup.tap do |next_world|
      @world.width.times do |x|
        @world.height.times do |y|
          next_world[x,y] = fate(x,y)
        end
      end
    end
  end

  # don't do recursion solution yet... get test to pass, then refactor
  # def calculate_state(state)
  #   if state.size > 3
  #     # calculate_state(state.slice(0...state.size - 1))
  #   else
  #     #do stuff
  #   end
  # end
  #
  # def calculate_atom_state(state)
  #   #   neighbors = world[0][0] + world[0][1] + world[0][2]
  #   #   neighbors += world[1][0] + world[1][2]
  #   #   neighbors += world[2][0] + world[2][1] + world [2][2]
  #   #   #do stuff
  # end

end