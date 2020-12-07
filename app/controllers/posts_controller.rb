class PostsController < ApplicationController
  def index
    @posts = Post.all.order(id: "DESC")
  end

  def create
    Post.create(content: params[:content])
    redirect_to action: :index
  end

  def cheched 
    post = Post.find(params[:id])
    if post.checked
      post.update(cheched: false)
    else
      post.update(cheched: true)
    end

    item = Post.find(params[:id])
    render json: { post: item }
end
