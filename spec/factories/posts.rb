FactoryBot.define do
  factory :post do
    title           {'test'}
    disease         {'test'}
    name            {Faker::Name.initials(number: 2)}
    age             {Faker::Number.between(from: 0, to: 100)}
    sex_id          {Faker::Number.between(from: 2, to: 4)}
    family          {'test'}
    airway          {'test'}
    breathing       {'test'}
    circulation     {'test'}
    dysfunction_cns {'test'}
    exposure        {'test'}
    symptom         {'test'}
    allergy         {'test'}
    medicine        {'test'}
    past_history    {'test'}
    last_meal       {'test'}
    event           {'test'}
    risk_factor     {'test'}
    others          {'test'}
    story           {Faker::Lorem.paragraph(sentence_count: 4)}
    point           {Faker::Lorem.paragraph(sentence_count: 4)}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
