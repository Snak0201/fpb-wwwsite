class Tools::CharacterCountersController < ApplicationController
  def show
    @character_counter = Tools::CharacterCounter.new
  end

  def create
    
  end
end
