module Tools
  class CharacterCounter
    include ActiveModel::Model
    attr_accessor :characters, :upper_limit

    validates :characters, presence: true
    validates :upper_limit, presence: true

    def count_characters
      characters.length
    end

    def calc_remains_of_upper_limit
      upper_limit = self.upper_limit.to_i

      if upper_limit <= 0
        return nil
      end

      upper_limit - count_characters
    end

    def calc_ratio_of_characters_to_upper_limit
      upper_limit = self.upper_limit.to_i

      if upper_limit <= 0
        return nil
      end

      (count_characters.to_f/upper_limit*100).round(2)
    end
  end
end
