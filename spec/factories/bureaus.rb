FactoryBot.define do
  factory :bureau do
    sequence(:name) { |n| "Test Bureau ##{n}" }
    sequence(:slug) { |n| "test-bureau-#{n}" }
    sequence(:content) { |n| "Test Bureau ##{n}'s content" }
  end
end
