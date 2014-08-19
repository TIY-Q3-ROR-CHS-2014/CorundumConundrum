class SmithsoniansController < ApplicationController
  before_action :authenticate_user!, only: [:show, :new, :edit, :update, :destroy]
  def index
    @smithsonians = Smithsonian.all
  end

  def show

    @smithsonian = Smithsonian.find params[:id]
    @mineral = @smithsonian.minerals.new
  end

  def new
    @smithsonian = Smithsonian.new
  end

  def create
    @smithsonian = Smithsonian.create smithsonian_params
    if @smithsonian.save
    redirect_to smithsonians_path
    else 
      render :new
    end
  end

  def edit
    @smithsonian = Smithsonian.find params[:id]
  end

  def update
    @smithsonian = Smithsonian.find params[:id]
    @smithsonian.update_attributes smithsonian_params
    redirect_to smithsonians_path
  end

  def destroy
    @smithsonian = Smithsonian.find params[:id]
    @smithsonian.delete
    redirect_to smithsonians_path
  end

  def add_mineral
    @smithsonian = Smithsonian.find params[:id]
    @smithsonian.minerals.create mineral_params
    redirect_to smithsonian_path(@smithsonian)
  end

  def delete_mineral
    @smithsonian = Smithsonian.find params[:id]
    @mineral = mineral.find params[:mineral_id]
    @mineral.delete
    redirect_to @smithsonian
  end

  private

  def smithsonian_params
    params.require(:smithsonian).permit(:name, :description)
  end


  def mineral_params
    params.require(:mineral).permit(:name, :moh, :origin)
  end

end
