class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :rop

  validates :nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birth, presence: true
  with_options allow_blank: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
    validates :first_name
    validates :last_name
  end

  with_options allow_blank: true, format: { with: /\A[ァ-ヶー]+\z/, message: '全角カナ文字を使用してください' } do
    validates :first_name_kana
    validates :last_name_kana
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, allow_blank: true, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
end
