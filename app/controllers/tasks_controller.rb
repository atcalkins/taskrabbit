class TasksController < ApplicationController
  before_action :find_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all.order('created_at_DESC')
  end

  def show
    #code
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to @task
    else
      render "New"
    end
  end

  def edit
    #code
  end

  def update
    if @task.update(tasks_params)
      redirect_to @task
    else
      render 'Edit'
    end
  end

  def destroy
    @task.destroy
    redirect_to root_path
  end

  private

  def tasks_params
    params.require(:task).permit(:title, :description, :company, :url)
  end

  def find_task
    @task = Task.find(params[:id])
  end
end
