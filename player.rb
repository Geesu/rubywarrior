require 'states/attack'
require 'states/walk'
require 'states/rest'
require 'states/rescue'
require 'states/change_direction'
require 'states/shoot'
require 'peaceful_warrior'
require 'pry'

class Player
  
  def start_engine
    build_engine
    @fsm.each do |state|
      if state.should_run?
        state.run
        @warrior.record_last_state(state)
        break
      end
    end
  end
  
  def build_engine
    @fsm = Array.new
    [State::Attack, State::Rest, State::Walk, State::Rescue, State::ChangeDirection, State::Shoot].map do |state|
      @fsm << state.new(@warrior)
    end
    @fsm = @fsm.sort_by{|state| -state.priority}
  end
  
  def play_turn(warrior)require "player"
    @warrior ||= PeacefulWarrior.new(warrior)
    @warrior.warrior = warrior
    @warrior.record_turn
    start_engine
    @warrior.turn_complete
  end
end
