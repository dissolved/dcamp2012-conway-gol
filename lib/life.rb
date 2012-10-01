class World
  def initialize state
    @state = state
    @height = @state.size
    @width = @state[0].size
    @time = 0
  end

  def export
    @state
  end

  def time
    @time
  end

  def iterate
    @time += 1
    @state = calculate_state
  end

  def [](x,y)
    @state[y % @height][x % @width]
  end
  #
  # def []=(x,y,value)
  #   @state[y][x] = value
  # end

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

  def fate(x,y)
    case neighbors(x,y)
    when 0..1 then 0
    when 2 then @state[y][x]
    when 3 then 1
    when 4..8 then 0
    end
  end

  protected

  def calculate_state
    next_state = []
    @state.each_with_index do |row, y|
      next_state << []
      row.size.times do |x|
        next_state[y] << fate(x,y)
      end
    end
    next_state
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
