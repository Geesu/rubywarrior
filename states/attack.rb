require 'states/state'

class State::Attack < State
  
  def initialize(warrior)
    @name = 'Attack'
    @priority = 50
    @warrior = warrior
  end
  
  def attack_forward?
    !@warrior.feel.empty? && @warrior.feel.enemy?
  end
  
  def attack_backward?
    !@warrior.feel(:backward).empty? && @warrior.feel(:backward).enemy?
  end
  
  def should_run?
    attack_forward? || attack_backward?
  end
  
  def run
    if attack_forward?
       @warrior.attack!
    else
       @warrior.attack!(:backward)
    end
  end
end
