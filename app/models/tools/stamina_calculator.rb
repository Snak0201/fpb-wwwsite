module Tools
  class StaminaCalculator
    include ActiveModel::Model
    attr_accessor :current_stamina, :target_stamina, :recover_stamina_seconds, :target_time

    validates :recover_stamina_seconds, presence: true, numericality: { greater_than: 0 }
    validates :current_stamina, presence: true, numericality: { greater_than_or_equal_to: 0 }

    validate :target_must_be_present
    validate :target_time_must_be_future

    def recover_time
      hours = seconds_to_recover_stamina_for_target / 3600
      minutes = (seconds_to_recover_stamina_for_target % 3600) / 60
      seconds = seconds_to_recover_stamina_for_target % 60

      { hours: hours.floor, minutes: minutes.floor, seconds: seconds.floor }
    end

    def recover_at
      Time.zone.now + seconds_to_recover_stamina_for_target
    end

    private

    def target_must_be_present
      return unless target_time.nil? || (target_stamina.blank? && target_time.blank?)

      errors.add(:base, '目標（3つめのボックス）を入力してください')
    end

    def target_time_must_be_future
      return unless target_time.present? && target_time < Time.zone.now

      errors.add(:target_time, 'は未来の日時を入力してください')
    end

    def recover_step
      # TODO: recover_stamina_seconds経過するといくつスタミナが回復するかを指定できるようにする
      1
    end

    def to_target_stamina
      target_stamina.to_f - current_stamina.to_f
    end

    def seconds_to_recover_stamina_for_target
      # NOTE: 目標までのスタミナが負ならもう達成しているので0
      return 0 if to_target_stamina.negative?

      (to_target_stamina * (recover_stamina_seconds.to_f / recover_step)).floor
    end
  end
end
