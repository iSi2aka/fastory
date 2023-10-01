class UsersController < ApplicationController
  def show
    @user = current_user
    @nickname = @user.nickname
    @posts = @user.posts
  end
end
