module Mutations
  class CreateTodo < BaseMutation
    description 'Create TODO'

    argument :priority, Types::PriorityEnum, required: true, description: 'TODO priority'
    argument :title, String, required: true, description: 'TODO title'

    field :todo, Types::TodoType, null: true, description: 'Created TODO'
    field :errors, [String], null: false, description: 'List of errors'

    def resolve(priority:, title:)
      todo = Todo.new(priority: priority, title: title)

      if todo.save
        {
          todo: todo,
          errors: [],
        }
      else
        {
          errors: todo.errors.full_messages
        }
      end
    end
  end
end
