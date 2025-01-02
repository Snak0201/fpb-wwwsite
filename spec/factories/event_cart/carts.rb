FactoryBot.define do
  factory :'event_cart/cart', class: 'EventCart::Cart' do
    name { 'Event' }
    held_at { Time.zone.today }
    place { 'Event Place' }
    atlas { nil }
    memo { nil }
    unique_code { SecureRandom.uuid }
    disabled { false }
    disabled_at { nil }
  end
end
