class ScientistsController < ApplicationController

  def index
    @scientists = Scientist.all
  end

  def show
    @scientist = Scientist.find params[:id]
  end

  def new
    @scientist = Scientist.new
  end

  def create
    @scientist = Scientist.new(scientist_params)
    if @scientist.save == true
      redirect_to scientists_path(@scientist)
    else
      render :new
    end
  end

  def edit
    @scientist = Scientist.find params[:id]
  end

  def update
    @scientist = Scientist.find params[:id]
    if @scientist.update_attributes scientist_params
      redirect_to scientists_path(@scientist)
    else
      render :edit
    end
  end

  def destroy
    @scientist = Scientist.find params[:id]
    @scientist.delete
    redirect_to scientists_path(@scientist)
  end

  private

  def scientist_params
    params.require(:scientist).permit(:name, :institution)
  end
  
end

