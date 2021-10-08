class TodoApi
  def initialize(url)
    @client = GraphQLClient.new(url)
  end

  def todos(priority: nil)
    @client.perform(TodoQueries::TODOS, priority: priority)
  end

  def create_todo(priority:, title:)
    @client.perform(TodoQueries::CREATE_TODO, priority: priority, title: title)
  end

  def delete_todo(id:)
    @client.perform(TodoQueries::DELETE_TODO, id: id)
  end
end
