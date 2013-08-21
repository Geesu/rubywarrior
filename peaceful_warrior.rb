require 'delegate'
class PeacefulWarrior < SimpleDelegator
  attr_accessor :last_state, :last_health, :has_hit_wall, :direction
  
  def initialize(warrior)
    @warrior = warrior
    @last_health = 20
    @has_hit_wall = false
    @direction = :left
    super(@warrior)
  end

  def warrior=(w)
    @warrior = w
    __setobj__(@warrior)
  end

  def record_last_state(state)
    @last_state = state
  end

  def record_turn
    if @turn.nil?
      @turn = 1
    else
      @turn = @turn + 1
    end
  end

  def max_health
    20
  end

  def losing_health?
    health < @last_health
  end
  
  def turn_complete
    @last_health = health
  end
  
  def change_direction
    if @direction == :right
      @direction = :left
    else
      @direction = :right      
    end
    self.pivot!
  end
end
