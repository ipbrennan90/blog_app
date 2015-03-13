class PostsController < ApplicationController
  before_action :find_and_set_user
  
  def new
    @post = @user.posts.new
  end

  private

  def find_and_set_user
    @user = User.find(params[:user_id])
  end


end
