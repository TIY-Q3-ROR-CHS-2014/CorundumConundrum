class MineralsController < ApplicationController

  def index
    @minerals = Mineral.all
    @smithsonian = Smithsonian.find params[:smithsonian_id]
  end

  def show
    @smithsonian = Smithsonian.find params[:smithsonian_id]
    @mineral = Mineral.find params[:id]
    @scientist = @mineral.scientists.new
  end

  def new
    @mineral = Mineral.new
    @smithsonian = Smithsonian.find params[:smithsonian_id]
  end

  def create
    @smithsonian = Smithsonian.find params[:smithsonian_id]
    @mineral = @smithsonian.minerals.new(mineral_params)
    if @mineral.save == true
      redirect_to smithsonians_path
    else
      render :new
    end
  end

  def edit
    @mineral = mineral.find params[:id]
    @smithsonian = Smithsonian.find params[:smithsonian_id]
  end

  def update
    @mineral = mineral.find params[:id]
    @smithsonian = Smithsonian.find params[:smithsonian_id]
    if @mineral.update_attributes mineral_params
      redirect_to smithsonians_path  
    else
      render :edit
    end
  end

  def destroy
    @mineral = mineral.find params[:id]
    @smithsonian = Smithsonian.find params[:smithsonian_id]
    @mineral.delete
    redirect_to smithsonians_path
  end

  def add_scientist
    @smithsonian = Smithsonian.find params[:smithsonian_id]
    @mineral = @smithsonian.minerals.find params[:id]
    @scientist = @mineral.scientists.create scientist_params
    redirect_to smithsonian_mineral_path(@smithsonian, @mineral)
  end

  def remove_scientist
    @smithsonian = Smithsonian.find params[:smithsonian_id]
    @mineral = @smithsonian.minerals.find params[:id]
    @scientist = @mineral.scientists.find params[:scientist_id]
    @scientist.delete
    redirect_to smithsonian_mineral_path(@smithsonian, @mineral)
  end
    

  private

  def mineral_params
    params.require(:mineral).permit(:name, :moh, :origin)
  end

  def scientist_params
      params.require(:scientist).permit(:name, :institution)
  end

end
