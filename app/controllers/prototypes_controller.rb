class PrototypesController < ApplicationController
  before_action :move_to_index, except: [:index]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  
  def index
    @prototype = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end
  
  def create
    @prototype = Prototype.create(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render template: "prototypes/new"
    end 
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def edit
    @prototype = Prototype.find(params[:id])
  end

  def update
    @prototype = Prototype.find(params[:id])
    if @prototype.update(prototype_params)
      flash[:success] = "Profile updated"
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to root_path
  end
  
  private
  def prototype_params
    params.require(:prototype).permit(:prototype_title, :prototype_catch_copy, :prototype_concept, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
