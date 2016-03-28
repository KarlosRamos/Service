FactoryGirl.define do
  factory :token do
    expires_at "2016-03-27 13:43:18"
    user nil
    association :user, factory: :user
  end
end
