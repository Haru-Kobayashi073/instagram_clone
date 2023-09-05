class Posts::LikesController < ApplicationController

  def create
    @post.likes.create(user: current_user)
  end

  def destroy
    @post.likes.find_by(user: current_user).destroy
  end

  @private

  def set_post
    @post = Post.find(params[:post_id])
  end


end
