class TasksController < ApplicationController
  def index  
    @tasks = Task.all
    respond_to do |format| 
      format.html
    end
  end

  def new  
    @task = Task.new
    respond_to do |format| 
      format.html
    end
  end

  def show
  end 
  
  def create
    @task = Task.new(params[:task]) 
    respond_to do |format|  
     if @task.save
       format.html  { redirect_to(tasks_path, :notice => "Task added") } 
     else
       format.html { render :action => "new"}
     end
    end
  end

end
