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

### Assotiation
- has_many :items
- has_many :purchases

## items テーブル

｜ Column             | Type       | options                        |
｜ ------------------ | ---------- | ------------------------------ |
｜ cateory_id         | integer    | null: false                    |
｜ name               | string     | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |
| item_condition_id   | integer    | null: false                    |
| postage_payer_id    | integer    | null: false                    |
| prefecture_id       | integer    | null: false                    |
| days_arrive_item_id | integer    | null: false                    |
| item_discription    | text       | null: false                    |

### Assotiation

- belongs_to :user
- has_one :purchase

### purchaseテーブル

| Column | Type        | option                           |
| user   | references  | null: false, foreign_key: true   |
| item   | references  | null: false, foreign_key: true   |

### Assotiation
- belongs_to :user
- belongs_to :item
- has_one :shipping_addres

### Shipping_addresses

| Column         | Type       | option                          |
| prefecture_id  | string     | null: false                     |
| building       | string     |                                 |
| city           | string     | null: false                     |
| zip_code       | string    | null: false                      |
| phone_number   | string     | null: false                     |
| address        | string     | null: false, foreign_key:true   |
| purchase       | reference  | null: false, foreign_key:true   |

### Assotiation
- belongs_to :purchase