class Zeus
  attr_reader :world

  NEXT = {2 => true, 3 => true}

  def initialize
    @world = []
  end

  def add_to_world(soul)
    world << soul
  end

  def reap!
    world.each do |soul|
      soul.die! unless lives?(soul.living_neighbors)
    end
  end

  protected

  def lives?(neighbors)
    !!NEXT[neighbors]
  end
end



class Soul


  attr_accessor :living_neighbors

  def die!
  end
end