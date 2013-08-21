require 'states/state'

class State::Walk < State
  
  def initialize(warrior)
    @name = 'Move'
    @priority = 10
    @warrior = warrior
  end
  
  def should_run?
    true
  end
  
  def run
    
    
    
    if @warrior.losing_health?
      
      direction_one_index = 0
      mob = @warrior.look.find{|space| 
        direction_one_index += 1
        space.enemy?
      }
      
      direction_two_index = 0
      mob2 = @warrior.look(:backward).find{|space| 
        direction_two_index += 1
        space.enemy?
      }
      
      
      
      
      
      
    end
    
    
    #if !@warrior.has_hit_wall
    #  @warrior.walk!(:backward)
    if @warrior.losing_health? && @warrior.feel.empty? && !@warrior.feel(:backward).wall? && @warrior.health < 8
      @warrior.walk!(:backward)
    else
      @warrior.walk!
    end
  end
end
