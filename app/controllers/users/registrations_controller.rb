# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # def index
  #   @users = User.all
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
  #   super
  # end

  # def update
  #   super
  # end

  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    redirect_to root_url
  end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
