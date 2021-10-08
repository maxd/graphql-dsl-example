module Types
  class PriorityEnum < Types::BaseEnum
    value 'LOW', 'Low priority', value: 'low'
    value 'MEDIUM', 'Medium priority', value: 'medium'
    value 'HIGH', 'High priority', value: 'high'
  end
end
