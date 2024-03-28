module Tools
  class CharacterCountersController < ApplicationController
    def show
      @character_counter = Tools::CharacterCounter.new
    end

    def create
      @character_counter = Tools::CharacterCounter.new(character_counter)
      render partial: 'count'
    end

    private

    def character_counter
      params.require(:tools_character_counter).permit(%i[fpl_characters upper_limit lower_limit])
    end
  end
end
