class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_one_attached :image

  validetes :product, presence: true
  
  validetes :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

  extend ActeiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :sender
  belongs_to :days_to_ship

  with options presence: true, numericality: { other_than: 1 }
    validates :category_id
    validates :condition_id
    validates :shipping_fee_id
    validates :sender_id
    validates :days_to_ship_id
  end
end
