FactoryBot.define do
  factory :diary do 
    country_id { 25 }
    city { 'Wellington'}
    category_id { 30 }
    date { Faker::Date.in_date_period }
    recommendations { 'おすすめ'}
    association :user
  end
end