module EventCarts
  class MarkDecorator < Draper::Decorator
    delegate_all

    def place
      "#{object.place_1st} #{object.place_2nd} #{object.place_3rd}"
    end
  end
end
