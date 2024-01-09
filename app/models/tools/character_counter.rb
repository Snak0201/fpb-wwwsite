class Tools::CharacterCounter
  include ActiveModel::Model
  attr_accessor :characters

  def count_characters
    characters.length
  end
end
