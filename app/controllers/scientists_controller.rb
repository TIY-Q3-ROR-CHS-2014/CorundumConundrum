class ScientistsController < ApplicationController

  def index
    @smithsonian = Smithsonian.find params[:smithsonian_id]
    @scientists = Scientist.all
    @mineral = Mineral.find params[:mineral_id] 
  end

  def show
    @mineral = Mineral.find params[:mineral_id]
    @smithsonian = Smithsonian.find params[:smithsonian_id]
    @scientist = Scientist.find params[:id]
  end

  def new
    @scientist = Scientist.new
    @mineral = Mineral.find params[:mineral_id]
    @smithsonian = Smithsonian.find params[:smithsonian_id]
  end

  def create
    @smithsonian = Smithsonian.find params[:smithsonian_id]
    @mineral = Mineral.find params[:mineral_id]

    @scientist = @mineral.scientists.new(scientist_params)
    if @scientist.save == true
      redirect_to smithsonian_mineral_path(@smithsonian, @mineral)
    else
      render :new
    end
  end

  def edit
    @smithsonian = Smithsonian.find params[:smithsonian_id]
    @mineral = Mineral.find params[:mineral_id]
    @scientist = Scientist.find params[:id]
  end

  def update
    @smithsonian = Smithsonian.find params[:smithsonian_id]
    @mineral = Mineral.find params[:mineral_id]
    @scientist = Scientist.find params[:id]
    if @scientist.update_attributes scientist_params
      redirect_to smithsonian_mineral_path(@smithsonian, @mineral) 
    else
      render :edit
    end
  end

  def destroy
    @smithsonian = Smithsonian.find params[:smithsonian_id]
    @mineral = Mineral.find params[:mineral_id]
    @scientist = Scientist.find params[:id]
    @scientist.delete
    redirect_to smithsonian_mineral_path(@smithsonian, @mineral)
  end

  private

  def scientist_params
    params.require(:scientist).permit(:name, :institution)
  end
  
end

