class Tools::StaminaCalculator
  include ActiveModel::Model
  attr_accessor :current_stamina, :target_stamina, :recover_one_stamina_seconds

  validates :current_stamina, :target_stamina, :recover_one_stamina_seconds, presence: true

  def to_target_stamina
    target_stamina - current_stamina
  end

  def seconds_to_recover_stamina_for_target
    return 0 if to_target_stamina < 0

    to_target_stamina * recover_one_stamina_seconds
  end
end
