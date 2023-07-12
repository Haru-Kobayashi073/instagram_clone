class PostsController < ApplicationController
  before_action :set_post, only: %i[show destroy]

  def show; end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user&.id
    if @post.save
      redirect_to root_url, notice: 'Post was successfully created.'
    else
      p @post.errors
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url, notice: "Post was successfully destroyed."
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:user_id, :description, :thumbnail)
  end
end
