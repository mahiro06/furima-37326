class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :quality
  belongs_to :prefecture
  belongs_to :shipping_date
  belongs_to :shipping_fee

  belongs_to :user
  has_one_attached :image

  validates :item_name, :item_info, :category_id, :quality_id, :prefecture_id, :shipping_date_id, :shipping_fee_id, :price,
            :image, presence: true
  validates :category_id, :quality_id, :prefecture_id, :shipping_date_id, :shipping_fee_id,
            numericality: { other_than: 1, message: "can't be blank" }
  with_options allow_blank: true, format: { with: /\A[0-9]+\z/, message: '半角数字を使用してください' } do
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end
  validates :item_name, length: { maximum: 40 }
  validates :item_info, length: { maximum: 1000 }
end
