require "forwardable"

class Cell
  extend Forwardable
  def_delegator :position, :x
  def_delegator :position, :y
  attr_reader :position

  def initialize(args)
    @state = args[:state]
    @position = args[:position]
  end

  def alive?
    @state == 'alive'
  end

  def neighbors_count

  end

end