class TodosController < ApplicationController 

    def index
        #render plain: Todo.order(:due_date).map{|todo| todo.to_pleasent_string}.join("\n")
        @todos=Todo.of_user(current_user)
        render "index"
    end

    def new 
    end 

    def create
        todo_text=params[:todo_text]
        due_date=params[:due_date]
        new_todo=Todo.new(
            todo_text: todo_text,
            due_date: due_date,
            completed: false,
            user_id: current_user.id,
        )
        if new_todo.save
            redirect_to todos_path 
        #response_text= "new todo #{new_todo.id}"
        #render plain:  response_text
        else
            flash[:error]= new_todo.errors.full_messages.join(", ")
            redirect_to todos_path
      end
    end

    def show
        id=params[:id]
        todo=Todo.of_user(current_user).find(id)
        render plain: todo.to_pleasent_string
    end

   

    def edit
    end 

    def update
        id=params[:id]
        completed=params[:completed]
        todo=Todo.of_user(current_user).find(id)
        todo.completed=completed
        todo.save!
        redirect_to todos_path
    end
    def destroy
        id=params[:id]
        todo=Todo.of_user(current_user).find(id)
        todo.destroy
        redirect_to todos_path
    end
end 