class BlogPostsController < ApplicationController
  before_action :set_blog_post, only: [:show, :edit, :update, :destroy]
  def index
    @blog_posts=BlogPost.all
  end

  def show

  end

  def new
    @blog_post=BlogPost.new
  end

  def edit
  end

  def update
    if @blog_post.update(blog_post_params)
      redirect_to @blog_post, notice: 'Contact was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @blog_post.destroy
    redirect_to blog_posts_path
  end




  def create
    BlogPost.create(blog_post_params)
    redirect_to blog_posts_path

    #if blog_post.save
      #redirect_to blog_posts_path
    #else
      # This is a convention for handling errors, which will be covered more closely at another time
      #@blog_post = BlogPost.new(blog_post_params)
      #render :new
    #end
  end



  private

  def set_blog_post
    @blog_post = BlogPost.find(params[:id])
  end

  def blog_post_params
    params.require(:blog_post).permit(:title, :content, :author)
  end




end
