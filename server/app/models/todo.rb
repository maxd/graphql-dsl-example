class Todo < ApplicationRecord
  extend Enumerize

  enumerize :priority, in: { low: 1, medium: 2, high: 3 }, default: :medium

  validates_length_of :title, maximum: 32
end
