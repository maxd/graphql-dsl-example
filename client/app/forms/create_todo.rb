class CreateTodo
  PRIORITIES = {
    'Low' => 'LOW',
    'Medium' => 'MEDIUM',
    'High' => 'HIGH',
  }

  attr_accessor :priority
  attr_accessor :title

  def initialize(priority: 'MEDIUM', title: nil)
    @priority = priority
    @title = title
  end
end
