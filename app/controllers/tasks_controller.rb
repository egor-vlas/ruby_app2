class TasksController < ApplicationController
  def index
  	@tasks = Task.all 
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
  	p @task = Task.new
  end

  def create
  	# new will reacieve a parametr from the virew form
  	@task = Task.new(task_params)
  	if @task.save
  	 redirect_to tasks_path
    else
      render 'new'

    end
  end

  def edit
  	@task = Task.find(params[:id])
  end

  def update
  	@task = Task.find(params[:id])
  	if @task.update(task_params)
  	 redirect_to tasks_path
    else
      render 'edit'
    end
  end

  def destroy
  	@task = Task.find(params[:id])
  	@task.destroy
  	redirect_to tasks_path
  end

  def complete
    @task = Task.find(params[:id])
    @task.update_attribute(:completed, params[:completed])
    redirect_to tasks_path
  end

  private
  #whitelist parameters
  def task_params
  	params.require(:task).permit(:title, :details, :completed)
  end
end
