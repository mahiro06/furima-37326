require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品新規登録' do
    context '新規登録できる場合' do
      it 'item_name,item_info,category_id,quality_id,prefecture_id,shipping_date_id,shipping_fee_id,priceが正しく存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '新規登録できない場合' do
      it 'imageが空で登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'item_nameが空で登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'item_infoが空で登録できない' do
        @item.item_info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item info can't be blank")
      end
      it 'category_idが空で登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'quality_idが空で登録できない' do
        @item.quality_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Quality can't be blank")
      end
      it 'prefecture_idが空で登録できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'shipping_date_idが空で登録できない' do
        @item.shipping_date_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date can't be blank")
      end
      it 'shipping_fee_idが空で登録できない' do
        @item.shipping_fee_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
      end
      it 'priceが空で登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが全角文字のため登録できない' do
        @item.price = '１１１１'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'item_nameが40文字以下でないため登録できない' do
        @item.item_name = Faker::Lorem.characters(41)
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name is too long (maximum is 40 characters)")
      end
      it 'item_infoが1000文字以下でないため登録できない' do
        @item.item_info = Faker::Base.regexify("[aあ]{1001}")
        @item.valid?
        expect(@item.errors.full_messages).to include("Item info is too long (maximum is 1000 characters)")
      end
      it 'priceが300円未満のため登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it 'priceが9,999,999円より大きいため登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
    end
  end

end
