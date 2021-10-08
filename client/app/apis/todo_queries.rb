class TodoQueries
  extend GraphQL::DSL
  using GraphQL::DSL

  TODOS = query(:todos, priority: :PriorityEnum) {
    todos(priority: :$priority) {
      id
      priority
      title
      createdAt
      updatedAt
    }
  }.to_gql

  CREATE_TODO = mutation(:createTodo, priority: :PriorityEnum!, title: :String!) {
    createTodo(input: { priority: :$priority, title: :$title }) {
      todo {
        id
        priority
        title
        createdAt
        updatedAt
      }
      errors
    }
  }.to_gql

  DELETE_TODO = mutation(:deleteTodo, id: :Int!) {
    deleteTodo(input: { id: :$id }) {
      errors
    }
  }.to_gql
end
