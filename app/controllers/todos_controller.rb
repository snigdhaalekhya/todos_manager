class TodosController < ApplicationController
    def index
        render plain: Todo.all.map{|todo| todo.to_pleasent_string}.join("\n")
    end
    def show
        id=params[:id]
        todo=Todo.find(id)
        render plain: todo.to_pleasent_string
end 