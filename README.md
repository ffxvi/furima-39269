# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
## usersテーブル

| Column             | Type     | Options        |
| ------------------ | -------- | -------------- |
| name               | string   | null:false     |
| email              | string   | null:false     |
| encrypted_password | string   | null:false     |
| first_name         | string   | null:false     |
| family_name        | string   | null:false     |
| birth_year         | string   | null:false     |
| birth_month        | string   | null:false     |
| birth_day          | string   | null:false     |  #中間テーブルのアソシエーションについてはまだ記述していない。こいつから外部キー制約も出そうと思ってるからそこらへんもあとでちゃんとチェックしないとな

### Association
- has_many :markets
- has_many :products, through: :markets

- has_many :user_purchases
- has_many :purchase_records, through: :user_purchases

- has_many :user_addresses
- has_many :shipping_addresses, through: user_addresses

## Productsテーブル

| Column            | Type      | Options        |
| ------------------| --------- | -------------- |
| image_file        | string    | null:false     |
| name              | string    | null:false     |
| profile           | string    | null:false     |
| price             | string    | null:false     |
| seller_id         | string    | null:false     |

### Association
- has_many :markets
- has_many :users, through: :markets

## marketsテーブル

| user_id    | string  | null:false |
| product_id | string  | null:false |

### Association
- belongs_to :users
- belongs_to :products


## Purchase_recordsテーブル

| Column            | Type      | Options                 |
| ------------------| --------- | ----------------------- |
| buyer             | string    | null:false              |
| sold_product      | string    | null:false unique: true |
| ship_address      | string    | null:false              |

### Association
- has_many :user_purchases
- has_many :users, through :user_purchases

##  Shipping_addressesテーブル

| Column            | Type      | Options                       |
| ------------------| --------- | ----------------------------- |
| post_number       | string    | null:false  foreign_key: true |
| city              | string    | null:false  foreign_key: true |
| st_address        | string    | null:false  foreign_key: true |
| build_name        | string    | foreign_key: true             |
| phone_number      | string    | null:false  foreign_key: true |

### Association
- has_many :user_addresses
- has_many :users, through: user_addresses

## User_addressesテーブル

| Column            | Type      | Options                       |
| ------------------| --------- | ----------------------------- |
| user_id           | string    | null:false  foreign_key: true |
| user_address      | string    | null:false  foreign_key: true |

### Association
- belongs_to :users
- belongs_to :shipping_addresses

## User_purchasesテーブル

| Column            | Type      | Options                       |
| ------------------| --------- | ----------------------------- |
| user_id           | string    | null:false foreign: true      |
| sold_products     | string    | null:false foreign: true      |

### Association
- belongs_to :users
- belongs_to :purchase_records




