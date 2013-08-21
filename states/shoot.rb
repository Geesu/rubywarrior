require 'states/state'

class State::Shoot < State
  
  def initialize(warrior)
    @name = 'Shoot'
    @priority = 75
    @warrior = warrior
  end
  
  def attack_forward?
    mob = @warrior.look.find{|space| !space.empty?}
    mob && mob.enemy?
  end
  
  def attack_backward?
    mob = @warrior.look(:backward).find{|space| !space.empty?}
    mob && mob.enemy?
  end
  
  def should_run?
    attack_forward? || attack_backward?
  end
  
  def run
    if attack_forward?
       @warrior.shoot!
    else
       @warrior.shoot!(:backward)
    end
  end
end
