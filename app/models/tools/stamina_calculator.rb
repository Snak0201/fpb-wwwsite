module Tools
  class StaminaCalculator
    include ActiveModel::Model
    attr_accessor :current_stamina, :target_stamina, :recover_stamina_seconds

    validates :current_stamina, :target_stamina, :recover_stamina_seconds,
              presence: true, numericality: { greater_than_or_equal_to: 0 }

    def recover_time
      hours = seconds_to_recover_stamina_for_target / 3600
      minutes = (seconds_to_recover_stamina_for_target % 3600) / 60
      seconds = seconds_to_recover_stamina_for_target % 60

      { hours:, minutes:, seconds: }
    end

    def recover_at
      Time.zone.now + seconds_to_recover_stamina_for_target
    end

    private

    def recover_step
      # TODO: recover_stamina_seconds経過するといくつスタミナが回復するかを指定できるようにする
      1
    end

    def to_target_stamina
      target_stamina - current_stamina
    end

    def seconds_to_recover_stamina_for_target
      # NOTE: 目標までのスタミナが負ならもう達成しているので0
      return 0 if to_target_stamina.negative?

      to_target_stamina * (recover_stamina_seconds / recover_step)
    end
  end
end
