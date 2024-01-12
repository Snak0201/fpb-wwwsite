FactoryBot.define do
  factory :article do
    title { "MyString" }
    content { "MyText" }
    number { 0 }
    published_at { "2024-01-12 02:10:10" }
  end
end
