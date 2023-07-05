class FollowersController < ApplicationController
  def index
    @followes = Follower.all
  end
  def follow
    
  end
  def unfollow
    @followers.destroy
    redirect_to followers_url, notice: "Followers was successfully destroyed."
  end
end
