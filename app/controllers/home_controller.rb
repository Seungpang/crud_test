class HomeController < ApplicationController
  def index
    @posts = Post.order("created_at DESC").page(params[:page])
  end

  def new
  end

  def create
    @post = Post.new
    @post.title = params[:post_title]
    @post.content  =params[:post_content]
    @post.name = params[:post_name]
    @post.password = params[:post_password]
    @post.save
    redirect_to "/home/show/#{@post.id}"
  end
  
  def show
    @post = Post.find(params[:post_id])
    @post.save
    
  end
  
  def destroy

    post=Post.find(params[:post_id])
    post.destroy
    redirect_to '/home/index'
  end
  
  def edit
    @post = Post.find(params[:post_id])
  end
  
  def update
    @post = Post.find(params[:post_id])
    @post.title = params[:post_title]
    @post.name = params[:post_name]
    @post.password = params[:post_password]
    @post.content = params[:post_content]
    @post.save
    
    redirect_to '/home/index'
  end

  

end

