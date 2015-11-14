class PostsController < ApplicationController

  def show
    @post = Post.find(params[:id])
  end


  def new
    @post = Post.new
  end


  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "New Post Created"
      redirect_to @post
    else
      flash.now[:danger] = "That didn't work!"
      render :new
    end
  end


  def edit
    @post = Post.find(params[:id])
  end


  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = "Post Editted"
      redirect_to @post
    else
      flash.now[:danger] = "That didn't work!"
      render :edit
    end
  end


  private


  def post_params
    params.require(:post).permit(:title, :body, :category_id, tag_ids: [])
  end

end
