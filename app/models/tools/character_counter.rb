module Tools
  class CharacterCounter
    include ActiveModel::Model
    attr_accessor :characters, :upper_limit, :lower_limit

    validates :characters, presence: true
    validates :upper_limit, presence: true


    def count_characters
      characters.length
    end

    def calc_remains_of_upper_limit
      upper_limit = self.upper_limit.to_i
      return nil if upper_limit <= 0

      upper_limit - count_characters
    end

    def calc_remains_of_lower_limit
      lower_limit = self.lower_limit.to_i
      return nil if lower_limit <= 0

      lower_limit - count_characters
    end

    def calc_ratio_of_characters_to_upper_limit
      upper_limit = self.upper_limit.to_i
      return nil if upper_limit <= 0

      ratio_to_limit(count_characters, upper_limit)
    end

    def calc_ratio_of_characters_to_lower_limit
      lower_limit = self.lower_limit.to_i
      return nil if lower_limit <= 0

      ratio_to_limit(count_characters, lower_limit)
    end

    private
    def ratio_to_limit(count_chars, limit)
      (count_chars.to_f / limit * 100).round(2)
    end
  end
end
