module Mutations
  class DeleteTodo < BaseMutation
    description 'Delete TODO'

    argument :id, Int, required: true, description: 'TODO identifier'

    field :errors, [String], null: false, description: 'List of errors'

    def resolve(id:)
      todo = Todo.find(id)
      todo.destroy!

      {
        errors: []
      }
    rescue => error
      {
        errors: [ error.message ]
      }
    end
  end
end
