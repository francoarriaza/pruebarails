class TodosController < ApplicationController

    def index
        @todos=Todo.all
    end

    def new
        @todos=Todo.new
    end

    def create
        @todo = Todo.new(todo_params)
        @todo.save
        redirect_to todos_path 
    end

    def show
        @todo = Todo.find(params[:id]) 
    end
    
    def edit
        @todo = Todo.find(params[:id])
    end

    def update
        @todo = Todo.find(params[:id])
        @todo.update(todo_params)
        redirect_to todos_path 
    end
    
    def destroy
        @todo = Todo.find(params[:id])
        @todo.destroy 
        redirect_to todos_path 
    end

    def completed
        @todo = Todo.find(params[:id])
        @todo.completed =true
        @todo.save
        redirect_to todos_patch
    end 
    
    def list
        @todos=Todo.all
    end

    private
    def set_todo
      @todo = Todo.find(params[:id])
    end

    def todo_params
      params.require(:todo).permit(:description)
    end   
end
