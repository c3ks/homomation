##
# Default users controller
#
class UsersController < ApplicationController
  before_action :authenticate_user! unless Rails.env == 'test'
  before_action :find_user, only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = t('.success')
      render :edit
    else
      flash[:warning] = t('.failure')
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = t('.success')
    else
      flash[:warning] = t('.failure')
    end
    render :edit
  end

  def destroy
    if @user.destroy
      flash[:success] = t('.success')
    else
      flash[:warning] = t('.failure')
    end
    redirect_to users_path
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:firstname, :lastname)
  end
end
