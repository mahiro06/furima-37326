class RopForm
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :building_address, :building, :tell, :user_id, :item_id, :token


  validates :postal_code, :prefecture_id, :city, :building_address, :tell, :user_id, :item_id, :token, presence: true
  with_options allow_blank: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'を正しく入力してください　例）123-4567' }
    validates :tell, format: { with: /\A\d{10,11}+\z/, message: 'を半角数字で入力してください（１０〜１１桁）　例）0123456789' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  end

  def save
    rop = Rop.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city,
                   building_address: building_address, building: building, tell: tell, rop_id: rop.id)
  end
end