class World
  def initialize state
    @state = state
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
    calculate_state(@state)
  end

  protected
  def calculate_state(state)
    if state.size > 3
      # calculate_state(state.slice(0...state.size - 1))
    else
      #do stuff
    end
  end

  def calculate_atom_state(state)
    #   neighbors = world[0][0] + world[0][1] + world[0][2]
    #   neighbors += world[1][0] + world[1][2]
    #   neighbors += world[2][0] + world[2][1] + world [2][2]
    #   #do stuff
  end

end
