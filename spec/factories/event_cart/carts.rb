FactoryBot.define do
  factory :'event_cart/cart', class: 'EventCart::Cart' do
    name { 'Event' }
    held_at { Time.zone.today }
    place { 'Event Place' }
    unique_code { SecureRandom.uuid }
  end

  trait :disabled do
    disabled { true }
    disabled_at { Time.current }
  end
end
