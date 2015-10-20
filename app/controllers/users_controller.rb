class UsersController < ApplicationController
  before_filter :admin_check, only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if params[:administrator]
      @user.administrator = true
    end
    binding.pry
    if @user.save
      flash[:notice] = "User successfully added!"
      session[:user_id] = @user.id
      redirect_to root_url, notice: "Thank you for signing up!"
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user= User.find(params[:id])
    if params[:administrator]
      @user.administrator = true
    end
    if @user.update(user_params)
      redirect_to users_path
    else
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:alert] = "User successfully deleted!"
    redirect_to users_path
  end

  private
    def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :administrator)
  end
end
