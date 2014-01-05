FactoryGirl.define do
  factory :event do
    sequence(:title) { |n| "Event #{n}" }
    date { Date.today }
  end
end
