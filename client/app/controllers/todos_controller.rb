class TodosController < ApplicationController
  before_action :build_api_client, except: [ :new ]

  def index
    response = @client.todos

    if response[:errors].present?
      flash.now[:errors] = response[:errors]
    else
      @todos = response[:data][:todos]
    end
  end

  def new
    @todo = CreateTodo.new
  end

  def create
    permitted_params = params.require(:todo).permit(:priority, :title)
    @todo = CreateTodo.new(**permitted_params.to_h.symbolize_keys)

    response = @client.create_todo(priority: @todo.priority, title: @todo.title)
    if response[:errors].present?
      flash.now[:errors] = response[:errors]

      render action: :new
    else
      redirect_to action: :index
    end
  end

  def destroy
    id = params[:id].to_i
    response = @client.delete_todo(id: id)

    if response[:errors].present?
      flash[:errors] = response[:errors]
    end

    redirect_to action: :index
  end

  private

  def build_api_client
    @client = TodoApi.new('http://localhost:4000/graphql')
  end
end
