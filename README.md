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


# テーブル設計

## users テーブル

| Column           | Type        | Options                              |
| -----------------| ------------| ------------------------------------ |
| first_name       | string      | null: false                          |
｜family_name      ｜string      ｜null:false                           ｜
| first_name_kana  | string      | null:false                           |
| family_name_kana | string      | null:false                           |
| birth_day        | date        | null:false                           |
| nickname         | string      | null: false                          |
| email            | string      | null:false, unique: true, index:true |
| password         | string      | null:false                           |

### 
- belongs_to :item
- has_many :parchase

## items テーブル

｜ Column          | Type       | options                        |
｜ --------------- | ---------- | ------------------------------ |
｜ cateory         | integer    | null: false                    |
｜ name            | string     | null: false                    |
| price            | integer    | null: false                    |
| shipping_user    | references | null: false, foreign_key: true |
| user_id          | integer    | null: false                    |
| size             | references | null: false, foreign_key: true |
| item_condition   | integer    | null: false                    |
| postage_payer    | integer    | null: false                    |
| brand            | references | foreign_key: true              |
| prefecture       | integer    | null: false                    |
| days_arrive_item | integer    | null: false                    |

### Assotiation

- belongs_to :user
- has_one :parchase
- has_many :items

### parchaseテーブル

| Column | Type        | option                           |
| user   | references  | null: false, foreign_key: true   |
| item   | references  | null: false, foreign_key: true   |

### Assotiation
- belongs_to :user
- belongs_to :item
- has_one :shipping_addres

### Shipping_addres

| Column         | Type       | option                          |
| addres_1       | string     | null: false                     |
| addres_2       | string     | null: false                     |
| state/Province | string     | null: false                     |
| city           | string     | null: false                     |
| postage        | string     | null: false                     |
| zip Code       | integer    | null: false                     |
| country|       | string     | null: false                     |
| phone_number   | string     | null: false                     |

### Assotiation
- belongs_to :parchase