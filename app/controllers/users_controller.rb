class UsersController < ApplicationController
  include AuthHelper

  before_action :logged_in?
  before_action :find_user, only: [:show, :edit, :update]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.image_url == nil
      @user.image_url = "http://i.imgur.com/lkLgThE.png"
    end
    if @user.save
      login(@user)
      redirect_to articles_path
    else
      redirect_to new_user_path
    end
  end

  def edit
  end

  def update
    if @user.image_url == nil
      @user.image_url = "http://i.imgur.com/lkLgThE.png"
    end
    if auth_through_user
      if @user.update(user_params)
        redirect_to @user
      else
        render :edit
      end
    end
  end

  private

  def find_user
    @user = User.find_by_id(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :user_name, :course_taken, :city, :password, :image_url)
  end

end
