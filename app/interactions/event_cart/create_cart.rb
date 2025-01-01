module EventCart
  class CreateCart < ApplicationInteraction
    string :name
    date :held_at
    string :place
    string :atlas, default: ''
    string :memo, default: ''

    def execute
      unique_code = SecureRandom.uuid
      EventCart::Cart.create!(name:, held_at:, place:, atlas:, memo:, unique_code:)
      unique_code
    end
  end
end
