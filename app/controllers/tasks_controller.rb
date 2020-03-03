class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:create, :index]

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
    @task = Task.new(task_params)
    @task.user = current_user
    # binding.pry
    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @task.user_id == current_user.id 
      respond_to do |format|
        if @task.update(task_params)
          # binding.pry
          format.html { redirect_to @task, notice: 'Task was successfully updated.' }
          format.json { render :show, status: :ok, location: @task }
        else
          format.html { render :edit }
          format.json { render json: @task.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to tasks_path
    end  
  end

  def destroy
    if @task.user_id == current_user.id
      @task.destroy
      respond_to do |format|
        format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
        format.json { head :no_content }
      end
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

    def logged_in_user
      unless user_signed_in?
        redirect_to sign_in_path
      end
    end
end
