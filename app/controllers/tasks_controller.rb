class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]

  def index
    @tasks = Task.all
  end

  def show;
    @message = if @task.completed 
                 'You have completed this task'
               else
                 'You have not completed this task.'
               end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash.notice = "Your task has been created."
      redirect_to task_path(@task)
    else
      flash.alert = @task.errors.full_messages
      render :new
    end
  end

  def update
    if @task.update(task_params)
      redirect_to task_path(@task)
    else
      render :edit
    end
  end

  def edit; end

  def destroy
    @task.destroy
    flash.notice = "Your task has been deleted."
    redirect_to tasks_path
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
