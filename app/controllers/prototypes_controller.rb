class PrototypesController < ApplicationController
  def index
    @prototype = Prototype.all
    @prototypes = Prototype.includes(:user)
  end

  def new
    @prototype = Prototype.new
    @prototypes = Prototype.includes(:user)
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      @prototypes = Prototype.includes(:user)
      render :new
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
  end

  def edit
    @prototype = Prototype.find(params[:id])
  end

  def update
    @prototype = Prototype.find(params[:id])
    @prototype.update_attributes(prototype_params)
    if @prototype.save
      redirect_to prototype_path
    else
      @prototype.attributes = prototype_params
      render :edit
    end
  end

  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    render action: :index
  end

  private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end
end
