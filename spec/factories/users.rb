FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { 'a1' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name             { 'あ亜ア' }
    first_name            { 'あ亜ア' }
    last_name_kana        { 'アアア' }
    first_name_kana       { 'アアア' }
    birth                 { Faker::Date.birthday }
  end
end
