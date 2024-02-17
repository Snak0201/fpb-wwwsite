module Tools
  class StaminaCalculatorsController < ApplicationController
    def show
      @calculator = Tools::StaminaCalculator.new
    end

    def create
      @calculator = Tools::StaminaCalculator.new(time_params)

      if @calculator.valid?
        @recover_time = @calculator.recover_time
        render partial: 'output'
      else
        render :show, status: :unprocessable_entity
      end
    end

    def show_stamina
      @calculator = Tools::StaminaCalculator.new
    end

    def create_stamina; end

    private

    def time_params
      params.require(:tools_stamina_calculator).permit(%i[current_stamina target_stamina recover_stamina_seconds])
    end

    def stamina_params; end
  end
end
