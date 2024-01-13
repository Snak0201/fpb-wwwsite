FactoryBot.define do
  factory :article do
    title { 'Test Article' }
    content { "Test Article's content" }
    number { 0 }
    published_at { DateTime.now }
  end
end
