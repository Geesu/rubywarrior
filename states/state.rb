class State
  attr_accessor :priority, :name

  def initialize(priority, name)
    @priority = priority
    @name = name
    self    
  end

  def should_run?
    false
  end
  
  def run
    false
  end
  
end