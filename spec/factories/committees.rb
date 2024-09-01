FactoryBot.define do
  factory :committee do
    sequence(:name) { |n| "Test Bureau ##{n}" }
    sequence(:slug) { |n| "test-bureau-#{n}" }
    description { 'description' }
    content { 'content' }
  end

  trait :special do
    special { true }
  end

  trait :with_bureau do
    bureau
  end
end
