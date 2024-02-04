FactoryBot.define do
  factory :article do
    sequence(:title) { |n| "Test Article ##{n}" }
    sequence(:content) { |n| "Test Article ##{n}'s content" }
    number { 0 }

    trait :published do
      published_at { Time.current }
    end
  end
end
