FactoryBot.define do
  factory :item do
    item_name         { Faker::Name.initials(number: 2) }
    item_info         { Faker::Lorem.sentence }
    price             { Faker::Number.within(range: 300..9_999_999) }
    category_id       { Faker::Number.within(range: 2..11) }
    quality_id        { Faker::Number.within(range: 2..7) }
    prefecture_id     { Faker::Number.within(range: 2..48) }
    shipping_date_id  { Faker::Number.within(range: 2..4) }
    shipping_fee_id   { Faker::Number.within(range: 2..3) }
    association       :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/image/item-sample.png'), filename: 'test-sample.png')
    end
  end
end
