class TodosController < ApplicationController
    def index
        render plain: Todo.all.map{|todo| todo.to_pleasent_string}.join("\n")
    end
end 