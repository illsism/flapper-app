class PostsController < ApplicationController
  before_filter :authenticate_user!, only: [:create, :upvote, :downvote]

  def index
    respond_with Post.all
  end

  def show
    respond_with Post.find(params[:id])
  end

  def create
    respond_with Post.create(post_params)
  end

  def upvote
    post = Post.find(params[:id])
    post.increment!(:upvotes)

    respond_with post
  end

  def downvote
    post = Post.find(params[:id])
    post.decrement!(:upvotes)

    respond_with post
  end

  private
  def post_params
    params.require(:post).permit(:link, :title)
  end
end
