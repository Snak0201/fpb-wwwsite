FactoryBot.define do
  factory :event_cart_cart, class: 'EventCart::Cart' do
    name { 'MyString' }
    held_at { '2024-12-31' }
    place { 'MyString' }
    atlas { 'MyString' }
    memo { 'MyText' }
    unique_code { 'MyString' }
    disabled { false }
    disabled_at { '2024-12-31 11:31:17' }
  end
end
