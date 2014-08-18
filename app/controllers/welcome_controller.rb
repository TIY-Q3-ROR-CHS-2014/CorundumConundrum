class WelcomeController < ApplicationController 
  @minerals = Mineral.all
  @smithsonian = Smithsonian.all
  @scientist = Scientist.all
end
