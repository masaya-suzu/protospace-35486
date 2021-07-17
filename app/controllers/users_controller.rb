class UsersController < ApplicationController
  def show
    @user = User.new
    user = User.find(params[:id])
    @name = user.name
    @profile = user.profile
    @occupation = user.occupation
    @position = user.position
    @prototype = user.prototype
    @prototype = @user.prototype.includes(:prototype)
  end
end