require 'states/state'

class State::ChangeDirection < State
  
  def initialize(warrior)
    @name = 'ChangeDirection'
    @priority = 25
    @warrior = warrior
  end
  
  def should_run?
    @warrior.feel.wall?
  end
  
  def run
    @warrior.change_direction
  end
end
