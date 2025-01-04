FactoryBot.define do
  factory :event_carts_mark, class: 'EventCarts::Mark' do
    event_carts_cart
    sequence(:name, 'Item_1')
  end

  trait :purchased do
    status { 1 }
    status_changed_at { Time.current }
  end
end
