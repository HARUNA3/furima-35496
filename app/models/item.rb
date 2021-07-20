class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :item_category
  belongs_to_active_hash :item_sales_status
  belongs_to_active_hash :item_scheduled_delivery
  belongs_to_active_hash :item_shipping_fee_status

  with_options presence: true do
    validates :user
    validates :image
    validates :name,       length: { maximum: 40 }
    validates :item_info,  length: { maximum: 1000 }
    validates :prefecture_id
    with_options numericality: { other_than: 1 } do
      validates :item_category_id
      validates :item_sales_status_id
      validates :item_shipping_fee_status_id
      validates :item_scheduled_delivery_id
    end
  end
  
  validates :item_price, numericality: { only_integer: true , greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

  belongs_to :user
  has_one_attached :image
end
