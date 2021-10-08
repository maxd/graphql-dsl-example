module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    description 'TODOs queries'

    field :todos, [TodoType], null: false do
      description 'List of TODO items'

      argument :priority, PriorityEnum,
               required: false,
               description: 'Priority'
    end

    def todos(priority: nil)
      scope = Todo
      scope = scope.where(priority: priority) if priority
      scope.order(priority: :desc, created_at: :desc)
    end
  end
end
