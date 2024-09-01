FactoryBot.define do
  factory :committee do
    sequence(:name) { |n| "Test Committee ##{n}" }
    sequence(:slug) { |n| "test-committee-#{n}" }
    sequence(:content) { |n| "Test Committee ##{n}'s content" }
  end

  trait :special do
    special { true }
  end

  trait :with_bureau do
    bureau
  end
end
