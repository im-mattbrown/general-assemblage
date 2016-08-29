class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find_by_id(params[:id])
    @articles = Article.where(user_id: params[:id])
    @comments = Comment.where(article_id: params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.image_url == ""
      @user.image_url = "http://imgur.com/a/FoI5q"
    end
    redirect_to @user
  end

  def edit
    @user = User.find_by_id(params[:id])
  end

  def update
    @user = User.find_by_id(params[:id])
    if @user.image_url == ""
      @user.image_url = "http://imgur.com/a/FoI5q"
    end
    @user.update(user_params)
    redirect_to @user
  end

private

def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :user_name, :image_url, :course_taken, :city, :password)
end

end
