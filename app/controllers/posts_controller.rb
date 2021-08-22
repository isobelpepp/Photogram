class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params) 
    if @post.save
      flash[:notice] = "Your post has been uploaded"
      redirect_to root_path
    else 
      flash[:notice] = "Please attach a picture"
      redirect_to new_post_path
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:caption, :image, :user_id)
  end

end
