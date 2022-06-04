FactoryBot.define do
  factory :rop_form do
    Faker::Config.locale = :ja
    postal_code { '000-0000' }
    prefecture_id { Faker::Number.within(range: 2..48) }
    city { Faker::Address.city }
    building_address { Faker::Address.name }
    building { 'マンション' }
    tell { Faker::Number.number(digits: 10) }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
