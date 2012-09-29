class World
  def initialize state
    @state = state
  end

  def export
    @state
  end
end


#
# def evaluate_world(world)
#   if world.size > 3
#     evaluate_world(world.slice(0...world.size - 1))
#
# end
#
# def evaluate_atom_world(world)
#   neighbors = world[0][0] + world[0][1] + world[0][2]
#   neighbors += world[1][0] + world[1][2]
#   neighbors += world[2][0] + world[2][1] + world [2][2]
#   #do stuff
# end