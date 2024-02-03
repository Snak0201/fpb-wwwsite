FactoryBot.define do
  factory :article do
    title { 'Test Article' }
    content { "Test Article's content" }
    number { 0 }

    trait :published do
      published_at { Time.current }
    end
  end
end
