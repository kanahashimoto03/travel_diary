FactoryBot.define do
  factory :comment do
    comment {'コメント'}
    association :user
    association :diary
  end
end