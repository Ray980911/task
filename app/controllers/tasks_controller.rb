class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.index_all.page(params[:page])
  end

  def show
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def mytask
    @tasks = Task.index_all.where(user_id: params[:id]).page(params[:page])
  end

  def assign
    @task = Task.find(params[:id])
  end

  def create
    @task = current_user.tasks.build(task_params)
      if @task.save
        redirect_to @task, notice: 'Task was successfully created.'
      else
        render :new
      end
  end

  def update
    if @task.user_id == current_user.id
        if @task.update(task_params)
          redirect_to @task, notice: 'Task was successfully updated.'
        else
          render :edit
        end
    else
      redirect_to tasks_path
    end
  end

  def destroy
    if @task.user_id == current_user.id
      @task.destroy
      redirect_to tasks_url, notice: 'Task was successfully destroyed.'
    else
      redirect_to tasks_path
    end
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :content, :deadline, :status, :user_id)
  end

end
