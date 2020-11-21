FactoryBot.define do
  factory :purchase_address do
    postal_code
    prefecture_id
    municipality
    street_number
    building_name
    phone_number
    association :user, :item, :purchase
    
  end
end
