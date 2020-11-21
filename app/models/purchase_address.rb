class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :sender, :municipality, :street_number, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :sender, numericality: { other_than: 1, message: 'Select' }
    validates :municipality
    validates :street_number
    validates :phone_number, format: { with: /\A[0-9]+\z/, message: 'is invalid. Except hyphen(-)' },
                             length: { maximum: 11 }
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: sender, municipality: municipality, street_number: street_number, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end
