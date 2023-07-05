class FollowsController < ApplicationController
  def index
    @follows = Follow.all
  end
  def follow
    @follow = Follow.new(post_params)

    if @post.save
      redirect_to post_url(@post), notice: 'Post was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end
  def unfollow
    @follows.destroy
    redirect_to follows_url, notice: "Follows was successfully destroyed."
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
