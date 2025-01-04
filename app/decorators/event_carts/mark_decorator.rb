module EventCarts
  class MarkDecorator < Draper::Decorator
    delegate_all

    def translated_status
      object.class.human_attribute_name("status.#{object.status}")
    end

    def place
      "#{object.place_1st} #{object.place_2nd} #{object.place_3rd}"
    end
  end
end
