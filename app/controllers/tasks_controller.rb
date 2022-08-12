class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def create
    task = Task.new({
      title: params[:task][:title],
      description: params[:task][:description]
      })
    #task = Task.new(task_params)

    task.save

    # redirect_to '/tasks'
    redirect_to tasks_path
  end

  def update
    task = Task.find(params[:id])
    task.update({
      title: params[:task][:title],
      description: params[:task][:description]
      })
    task.save
    # redirect_to "/tasks/#{task.id}"
    redirect_to task_path(task)
  end

  def destroy
    Task.destroy(params[:id])
    # redirect_to '/tasks'
    redirect_to tasks_path
  end
  

  # private
  # def task_params
  #   params.permit({
  #     title: params[:task][:title],
  #     description: params[:task][:description]
  #     })
  # end
end