require 'states/state'

class State::Rest < State
  
  def initialize(warrior)
    @name = 'Rest'
    @priority = 100
    @warrior = warrior
  end

  def should_run?
    return false if @warrior.health == 20
    return false if @warrior.feel.stairs?
    if @warrior.losing_health? && @warrior.feel.empty? && @warrior.last_state.class != self.class
      true
    elsif @warrior.feel.empty? && !@warrior.losing_health?
      true
    else
      false
    end
  end

  def run
     @warrior.rest!
  end
end