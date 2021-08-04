class UsersController < ApplicationController
  def show
    @user = User.new
    user = User.find(params[:id])
    @name = user.name
    @profile = user.profile
    @occupation = user.occupation
    @position = user.position
    @prototype = user.prototypes
    @prototype = @user.prototypes.includes(:prototype)
  end
end
