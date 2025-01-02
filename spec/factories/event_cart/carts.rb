FactoryBot.define do
  factory :'event_carts/cart', class: 'EventCarts::Cart' do
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
