class PostsController < ApplicationController
  before_action :find_and_set_user
  before_action :set_post, only: [:show, :update]

  def new
    @post = @user.posts.new
  end

  def index
    @posts = @user.posts.all
  end


  def create
    @post = @user.posts.new(post_params)
    if @post.save
      flash[:notice] = "Post has been created"
      redirect_to user_posts_path(@user)
    else
      render :new
    end
  end

  def show
  end

  def update
    if @post.update(post_params)
      redirect_to user_post_path(@user,@post), notice: "Post has been successfully updated"
    else
      redirect_to user_post_path(@user,@post)
    end
  end

  private

  def find_and_set_user
    @user = User.find(params[:user_id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :user_id, :category_id)
  end

  def set_post
    @post=Post.find(params[:id])
  end




end
