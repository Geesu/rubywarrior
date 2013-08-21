require 'states/state'

class State::Rescue < State
  
  def initialize(warrior)
    @name = 'Rescue'
    @priority = 75
    @warrior = warrior
  end
  
  def rescue_forward?
    @warrior.feel.captive?
  end
  
  def rescue_backward?
    @warrior.feel(:backward).captive?
  end
  
  def should_run?
    rescue_forward? || rescue_backward?
  end
  
  def run
    if rescue_forward?
       @warrior.rescue!
    else
       @warrior.rescue!(:backward)
    end
  end
end
