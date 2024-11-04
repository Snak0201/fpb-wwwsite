class Tools::CharacterCounter::Limit::Calculate < ActiveInteraction::Base
  integer :characters_length
  integer :upper_limit
  integer :lower_limit

  def execute
    {
      remains_of_upper_limit:,
      remains_of_lower_limit:,
      
    }
  end

  private
  def remains_of_upper_limit
    return nil if upper_limit <= 0

    upper_limit - characters_length
  end

  def remains_of_lower_limit
    return nil if lower_limit <= 0

    lower_limit - characters_length
  end

  def ratio_of_upper_limit

  end
end
