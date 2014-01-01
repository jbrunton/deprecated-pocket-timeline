FactoryGirl.define do
  factory :timeline do
    sequence(:title) { |n| "Timeline #{n}" }
  end
end
