class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all.reject { |user| user == current_user }
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.ordered_by_most_recent
    @invited = current_user.requested_friends.pluck(:friend_id)
  end
end
