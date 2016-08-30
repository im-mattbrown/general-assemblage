class UsersController < ApplicationController
include AuthHelper

  def index
    @users = User.all
  end

  def show
    @user = User.find_by_id(params[:id])
    @articles = Article.paginate(page: params[:page], per_page: 15)
    @q = Article.ransack(params[:q])
    @q.sorts = 'created_at desc' if @q.sorts.empty?
    @search = @q.result.paginate(page: params[:page], per_page: 15)
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
    @user = User.find_by_id(params[:id])
  end

  def update
    @user = User.find_by_id(params[:id])
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

def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :user_name, :course_taken, :city, :password, :image_url)
end
end
