FactoryBot.define do
  factory :article do
    sequence(:title) { |n| "Test Article ##{n}" }
    sequence(:content) { |n| "Test Article ##{n}'s content" }
    number { 0 }

    trait :published do
      published_at { Time.current }
    end

    trait :with_bureau do
      after(:build) do |article|
        article.bureaus << build(:bureau)
      end
    end

    trait :with_committee do
      after(:build) do |article|
        article.committees << build(:committee)
      end
    end
  end
end
