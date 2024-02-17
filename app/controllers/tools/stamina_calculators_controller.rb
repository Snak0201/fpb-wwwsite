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

    def create_stamina
      @calculator = Tools::StaminaCalculator.new(stamina_params)
      return if @calculator.valid?

      render :show_stamina, status: :unprocessable_entity
    end

    private

    def time_params
      permitted_params = params.require(:tools_stamina_calculator).permit(:current_stamina, :target_stamina,
                                                                          :recover_stamina_seconds)
      permitted_params[:target_time] = ''
      permitted_params
    end

    def stamina_params
      permitted_params = params.require(:tools_stamina_calculator).permit(:recover_stamina_seconds, :current_stamina,
                                                                          :raw_target_time, :target_stamina)
      permitted_params[:target_time] = parse_datetime(permitted_params[:raw_target_time])
      permitted_params.delete(:raw_target_time)
      permitted_params
    end

    def parse_datetime(datetime)
      return nil if datetime.blank?

      Time.zone.parse(datetime)
    end
  end
end
