# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # def index
  # end

  def show
    @user = User.find(params[:id])
    @tasks = Task.index_all.where(user_id: params[:id]).page(params[:page])
  end

  # def new
  # end

  # def create
  #   @user = User.new(configure_sign_up_params)
  #   if @user.save
  #     redirect_to root_url, notice: "Please check your email to activate your account."
  #   end
  # end

  # def edit
  # end

  # def update
  # end

  # def destroy
  # end


  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:icon])
  end

  def after_sign_up_path_for(resource)
    redirect_to root_url
  end

  def after_inactive_sign_up_path_for(resource)
    root_path
  end
end
