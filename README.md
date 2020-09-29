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


| Column        | Type        | Options                              |
| --------------| ------------| ------------------------------------ |
| first_name    | string      | null: false                          |
｜family_name   ｜string      ｜null:false                           ｜
| birth_day     | date        | null:false                           |
| birth_month   | date        | null:false                           |
| birth_year    | date        | null:false                           |
| introduction  | text        |                                      |
| username      | references  | null: false, foreign_key: true       |
| Email         | string      | null:false, unique: true, index:true |

### Association

- has_many :room_users
- has_many :users, through: room_users
- has_many :messages

## items テーブル

｜ Column  | Type       | options                        |
｜ ------- | ---------- | ------------------------------ |
｜ cateory | references | null: false, foreign_key: true |
｜ name    | string     | null: false                    |

### Association

- has_many :comments

### comments 中間テーブル

- belongs_to :item
- belongs_to :user

### parchase

| Column | Type        | option                         |
| use_id |             |                                |
| item_id|             |                                |


### Assotiation
- has_one

### Shipping_addres

| Column | Type       | option                          |
| addres |            |                                 |
| city   |            |                                 |
| postage|                   |                                 |

### Assotiation
- belongs_to