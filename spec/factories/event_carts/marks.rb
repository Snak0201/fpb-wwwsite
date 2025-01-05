FactoryBot.define do
  factory :'event_carts/mark', class: 'EventCarts::Mark' do
    cart factory: %i[event_carts/cart]
    sequence(:name, 'Item_1')
  end

  trait :purchased do
    status { 1 }
    status_changed_at { Time.current }
  end
end
