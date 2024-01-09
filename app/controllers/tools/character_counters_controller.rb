class Tools::CharacterCountersController < ApplicationController
  def show
    @character_counter = Tools::CharacterCounter.new
  end

  def create
    @characters = character_counter[:characters]
  end

  private
  def character_counter
    params.require(:tools_character_counter).permit(:characters)
  end
end
