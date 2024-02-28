module Tools
  module CharacterCountersHelper
    def show_remains_of_upper_limit(remains_of_upper_limit)
      if remains_of_upper_limit >= 0
        "上限まで残り#{remains_of_upper_limit}字です"
      else
        "上限を#{-remains_of_upper_limit}字超過しています"
      end
    end

    def show_remains_of_lower_limit(remains_of_lower_limit)
      if remains_of_lower_limit >= 0
        "下限から#{remains_of_lower_limit}字不足しています"
      else
        "下限をクリアし、#{-remains_of_lower_limit}字多いです"
      end
    end
  end
end
