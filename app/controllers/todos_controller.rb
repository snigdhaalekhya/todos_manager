class TodosController < ApplicationController 
    def index
        #render plain: Todo.order(:due_date).map{|todo| todo.to_pleasent_string}.join("\n")
        current_user
        render "index"
    end

    def new 
    end 

    def create
        todo_text=params[:todo_text]
        due_date=DateTime.parse(params[:due_date])
        new_todo=Todo.create!(
            todo_text: todo_text,
            due_date: due_date,
            completed: false,
        )
        #response_text= "new todo #{new_todo.id}"
        #render plain:  response_text
        redirect_to todos_path
    end

    def show
        id=params[:id]
        todo=Todo.find(id)
        render plain: todo.to_pleasent_string
    end

   

    def edit
    end 

    def update
        id=params[:id]
        completed=params[:completed]
        todo=Todo.find(id)
        todo.completed=completed
        todo.save!
        redirect_to todos_path
    end
    def destroy
        id=params[:id]
        todo=Todo.find(id)
        todo.destroy
        redirect_to todos_path
    end
end 