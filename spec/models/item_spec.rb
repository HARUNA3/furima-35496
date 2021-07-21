require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品機能がうまくいくとき' do
      it "image、name、user、item_info、item_category_id、item_sales_status_id、item_shipping_fee_status_id、prefecture_id、item_schedulued_delivery_id、item_priceがあれば出品出来る" do
        expect(@item).to be_valid
      end
      it "販売価格を入れると販売手数料、販売利益が表示される" do
        expect(@item).to be_valid
      end
    end

    context '商品出品機能がうまくいかないとき' do
      it "imageが空だと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "nameが空だと登録できない" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "item_infoが空だと登録できない" do
        @item.item_info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item info can't be blank")
      end
      it "item_category_idが空だと登録できない" do
        @item.item_category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item category can't be blank")
      end
      it "item_category_idが1だと登録できない" do
        @item.item_category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item category must be other than 1")
      end
      it "item_sales_status_idが空だと登録できない" do
        @item.item_sales_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item sales status can't be blank")
      end
      it "item_sales_status_idが1だと登録できない" do
        @item.item_sales_status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item sales status must be other than 1")
      end
      it "item_shipping_fee_status_idが空だと登録できない" do
        @item.item_shipping_fee_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item shipping fee status can't be blank")
      end
      it "item_shipping_fee_status_idが1だと登録できない" do
        @item.item_shipping_fee_status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item shipping fee status must be other than 1")
      end
      it "prefecture_idが空だと登録できない" do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "item_scheduled_delivery_idが空だと登録できない" do
        @item.item_scheduled_delivery_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item scheduled delivery can't be blank")
      end
      it "item_scheduled_delivery_idが1だと登録できない" do
        @item.item_scheduled_delivery_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item scheduled delivery must be other than 1")
      end
      it "item_priceが空だと登録できない" do
        @item.item_price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price is not a number")
      end
      it "item_priceが$300以下では登録できない" do
        @item.item_price = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price must be greater than or equal to 300")
      end
      it "item_priceが$9,999,999以上では登録できない" do
        @item.item_price = '99999991'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price must be less than or equal to 9999999")
      end
      it "item_priceが全角文字では登録できない" do
        @item.item_price = '３３３'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price is not a number")
      end
      it "item_priceが文字混合では登録できない" do
        @item.item_price = 'a123'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price is not a number")
      end
      it "user情報が無いと登録できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end