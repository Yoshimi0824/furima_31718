FactoryBot.define do
  factory :purchase_address do
    postal_code { '111-1111' }
    sender { Faker::Number.between(from: 2, to: 48) }
    municipality  { Gimei.address.city.kanji }
    street_number { Gimei.address.town.kanji }
    building_name { 'マンション名' }
    phone_number  { Faker::Number.number(digits: 11) }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
