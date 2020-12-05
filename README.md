# furima-29105 README

# Contents
  アプリケーション内で個人同士の物品売買ができる

# Feature
  物品一覧で写真や金額を一眼で確認でき、簡単に比較しながら購入できる
  [実装内容]               [実装理由]     
  * アカウント登録機能       * アプリケーションを理由する毎に情報を入力することは使用者にとって不便な為
  * 商品登録機能            * 出品した後に商品情報(紹介や在庫状況等）を更新できる必要がある為
  * 購入記録機能            * いつ誰が何を購入したか管理する必要がある為


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

# テーブル設計

## usersテーブル
| Column                | Type     | Option      |
| ----------------------| ---------|-------------|
|  nickname             | string   | null: false |
|  email                | string   | null: false |
|  encrypted_password   | string   | null: false |
|  family_name          | string   | null: false |
|  first_name           | string   | null: false |
|  family_name_kana     | string   | null: false |
|  first_name_kana      | string   | null: false |
|  birth_day            | date     | null: false |


### Association
- has_many :items
- has_many :buy_records

## itemsテーブル
| Column         | Type      | Option                        |
|----------------|---------- |-------------------------------|
|  user          | references| null :false, foreign_key :true|
|  name          | string    | null :false                   |
|  introduction  | text      | null :false                   |
|  price         | integer   | null :false                   |
|  category_id   | integer   | null :false                   |
|  status_id     | integer   | null :false                   |
|  charge_id     | integer   | null :true                    |
|  prefecture_id | integer   | null :false                   |
|  ship_date_id  | integer   | null :false                   |

### Association
- belongs_to :user
- has_one :buy_record

## buy_recordsテーブル
| Column       | Type      | Option                         |
| -------------|-----------|--------------------------------|
| user         | references| null :false, foreign_key :true |
| item         | references| null :false, foreign_key :true |

### Association
- has_one :address
- belongs_to :user
- belongs_to :item

## addressesテーブル
| Column         | Type      | Option                         |
|----------------|-----------|--------------------------------|
| buy_record     | references| null :false, foreign_key :true |
| post_cord      | string    | null :false                    |
| prefecture_id  | integer   | null :false                    |
| municipality   | string    | null :false                    |
| address_number | string    | null :false                    |
| building       | string    |                                |
| phone_number   | string    | null :false                    |

### Association
- belongs_to :buy_record



