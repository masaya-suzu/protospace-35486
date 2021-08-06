class UsersController < ApplicationController
  def show
    @user = User.new
    user = User.find(params[:id])
    @name = user.name
    @profile = user.profile
    @occupation = user.occupation
    @position = user.position
    @prototypes = user.prototypes
    @prototype = @user.prototypes.includes(:prototype)
  end
end
