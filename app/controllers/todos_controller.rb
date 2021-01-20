class TodosController < ApplicationController
  def index
    render plain: Todo.all.map { |todo| todo.to_displayable_string }
  end

  def show
    id = params[:id]
    todos = Todo.where(id: id)
    render plain: todos.map { |todo| todo.to_displayable_string }
  end
end