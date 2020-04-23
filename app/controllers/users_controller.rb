class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin, only: [:new, :create]

  before_action :find_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all.paginate(page: params[:page]).order(created_at: :desc)
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to users_path, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to users_path, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
      redirect_to users_path, notice: 'User was successfully destroyed.'
    end
  end

  private

  def authorize_admin
    return unless !current_user.admin?
    redirect_to root_path, alert: 'Admins permissions insufficient'
  end

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :admin)
  end
end
