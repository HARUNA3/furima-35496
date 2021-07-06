# README

# テーブル設計

## usersテーブル

| Column          | Type   | Options     | 
| --------------- | ------ | ----------- | 
| nickname        | string | null: false | 
| email           | string | null: false | 
| password        | string | null: false | 
| last-name       | string | null: false | 
| first-name      | string | null: false | 
| last-name-kana  | string | null: false | 
| first-name-kana | string | null: false | 
| birth-date      | date   | null: false | 

### Association

- has_many :items
- has_many :orders

## itemsテーブル

| Column                   | Type    | Options     | 
| ------------------------ | ------- | ----------- | 
| item-name                | string  | null: false | 
| item-info                | text    | null: false | 
| item-category            | string  | null: false | 
| item-sales-status        | string  | null: false | 
| item-shipping-fee-status | string  | null: false | 
| item-prefecture          | string  | null: false | 
| item-scheduled-delivery  | integer | null: false | 
| item-price               | integer | null: false | 
| item-image               | image   | null: false | 
| add-tax-price            | integer | null: false | 
| profit                   | integer | null: false | 

### Association

- belongs_to :user
- has_one :order

## ordersテーブル

| Column                   | Type    | Options     | 
| ------------------------ | ------- | ----------- | 
| item-name                | string  | null: false | 
| item-info                | text    | null: false | 
| item-category            | string  | null: false | 
| item-sales-status        | string  | null: false | 
| item-shipping-fee-status | string  | null: false | 
| item-prefecture          | string  | null: false | 
| item-scheduled-delivery  | integer | null: false | 
| item-price               | integer | null: false | 
| item-image               | image   | null: false | 
| add-tax-price            | integer | null: false | 
| profit                   | integer | null: false | 

### Association

- belongs_to :user
- belongs_to :item