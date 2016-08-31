class UsersController < ApplicationController

  include AuthHelper

  before_action :logged_in?, except: [:index, :new, :create]
  before_action :find_user, only: [:show, :edit, :update]

  def index
    @users = User.all
  end

  def show
    @comment = Comment.find_by_id(params[:id])
    @article = Article.find_by_id(params[:id])
    @articles_count = Article.where(:user_id => @user.id).length
    @articles = Article.where(:user_id => @user.id).paginate(page: params[:page], per_page: 15).order('created_at DESC')
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.image_url == ""
      @user.image_url = "http://i.imgur.com/DMABUhJ.png"
    end
    if @user.save
      login(@user)
      flash[:notice] = "Congratulations, you have successfully signed up!"
      redirect_to user_path(@user)
    else
      flash[:notice] = "Sorry, please try again.There are some issues:  #{@user.errors.full_messages.join(', ')}."
      redirect_to new_user_path
    end
  end

  def edit
    if !auth_through_user
      auth_fail("That ain't yours!", articles_path)
    end
  end

  def update
    if @user.image_url == ""
      @user.image_url = "http://i.imgur.com/DMABUhJ.png"
    end
    if auth_through_user
      if @user.update(user_params)
        flash[:notice] = "Your profile was successfully updated."
        redirect_to @user
      else
        render :edit
      end
      else
        auth_fail("not authorized to update that", articles_path)
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
