FactoryBot.define do
  factory :comment do
    comment     {Faker::Lorem.paragraph(sentence_count: 4)}
    association :post
    association :user
  end
end
