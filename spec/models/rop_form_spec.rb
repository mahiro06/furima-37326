require 'rails_helper'

RSpec.describe RopForm, type: :model do
  describe '購入履歴の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @rop_form = FactoryBot.build(:rop_form, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されている場合' do
        expect(@rop_form).to be_valid
      end
      it 'buildは空欄でも登録できること' do
        @rop_form.building = nil
        expect(@rop_form).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @rop_form.postal_code = nil
        @rop_form.valid?
        expect(@rop_form.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeに-が含まれていないため保存されないこと' do
        @rop_form.postal_code = '11111111'
        @rop_form.valid?
        expect(@rop_form.errors.full_messages).to include("Postal code を正しく入力してください　例）123-4567")
      end
      it 'postal_codeの桁数が正しくないため保存されないこと' do
        @rop_form.postal_code = '0000-0000'
        @rop_form.valid?
        expect(@rop_form.errors.full_messages).to include("Postal code を正しく入力してください　例）123-4567")
      end
      it 'prefecture_idが空だと保存できないこと' do
        @rop_form.prefecture_id = '1'
        @rop_form.valid?
        expect(@rop_form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @rop_form.city = nil
        @rop_form.valid?
        expect(@rop_form.errors.full_messages).to include("City can't be blank")
      end
      it 'building_addressが空だと保存できないこと' do
        @rop_form.building_address = nil
        @rop_form.valid?
        expect(@rop_form.errors.full_messages).to include("Building address can't be blank")
      end
      it 'tellが空だと保存できないこと' do
        @rop_form.tell = nil
        @rop_form.valid?
        expect(@rop_form.errors.full_messages).to include("Tell can't be blank")
      end
      it 'tellが１０桁未満のため保存できないこと' do
        @rop_form.tell = '111111111'
        @rop_form.valid?
        expect(@rop_form.errors.full_messages).to include("Tell を半角数字で入力してください（１０〜１１桁）　例）0123456789")
      end
      it 'tellが１２桁以上のため保存できないこと' do
        @rop_form.tell = '111111111111'
        @rop_form.valid?
        expect(@rop_form.errors.full_messages).to include("Tell を半角数字で入力してください（１０〜１１桁）　例）0123456789")
      end
      it 'tellに半角数字以外が含まれるため保存できない' do
        @rop_form.tell = 'a111111111'
        @rop_form.valid?
        expect(@rop_form.errors.full_messages).to include("Tell を半角数字で入力してください（１０〜１１桁）　例）0123456789")
      end
      it 'userが紐付いていないと保存できないこと' do
        @rop_form.user_id = nil
        @rop_form.valid?
        expect(@rop_form.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @rop_form.item_id = nil
        @rop_form.valid?
        expect(@rop_form.errors.full_messages).to include("Item can't be blank")
      end

      it 'tokenが空で登録できないこと' do
        @rop_form.token = nil
        @rop_form.valid?
        expect(@rop_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
