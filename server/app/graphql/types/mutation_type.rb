module Types
  class MutationType < Types::BaseObject
    description 'TODO mutations'

    field :create_todo, mutation: Mutations::CreateTodo
    field :delete_todo, mutation: Mutations::DeleteTodo
  end
end
