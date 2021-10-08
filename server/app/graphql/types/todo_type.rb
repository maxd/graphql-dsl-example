module Types
  class TodoType < Types::BaseObject
    description 'TODO item'

    field :id, ID,
          null: false,
          description: 'TODO identifier'
    field :priority, PriorityEnum,
          null: false,
          description: 'TODO priority'
    field :title, String,
          null: false,
          description: 'TODO title'
    field :created_at, GraphQL::Types::ISO8601DateTime,
          null: false,
          description: 'Creation time of TODO'
    field :updated_at, GraphQL::Types::ISO8601DateTime,
          null: false,
          description: 'Update time of TODO'
  end
end
