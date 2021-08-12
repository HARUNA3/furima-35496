FactoryBot.define do
  factory :purchase_address do
    purchase_id   { 10 }
    postal_code   { '123-4567' }
    prefecture_id { 2 }
    city          { '東京都' }
    address       { '1-1' }
    building      { '東京ハイツ' }
    phone_number  { '090-1111-2222' }
    token         { 'tok_abcdefghijk00000000000000000' }
    association :user
    association :item
  end
end
