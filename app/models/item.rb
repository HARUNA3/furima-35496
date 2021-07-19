class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :item_category
  belongs_to_active_hash :item_sales_status
  belongs_to_active_hash :item_scheduled_delivery
  belongs_to_active_hash :item_shipping_fee_status

  with_options presence: true do
    validates :user
    validates :name,       length: { maximum: 40 }
    validates :item_info,  length: { maximum: 1000 }
    with_options numericality: { other_than: 1 } do
      validates :item_category_id
      validates :item_sales_status_id
      validates :item_shipping_fee_status_id
      validates :prefecture_id
      validates :item_scheduled_delivery_id
    end
  end
  validates :item_price numericality: { 300-9999999 }
end
