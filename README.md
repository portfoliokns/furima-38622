# テーブル設計

## users テーブル ： ユーザー管理テーブル
| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| first_name         | string  | null: false               |
| last_name          | string  | null: false               |
| first_name_kana    | string  | null: false               |
| last_name_kana     | string  | null: false               |
| birth_date         | date    | null: false               |

# アソシエーション
has_many :items
has_many :orders

##  itemsテーブル ： 商品出品テーブル

| Column            | Type       | Options                        |
| --------------    | ---------- | ------------------------------ |
| name              | string     | null: false                    |
| description       | text       | null: false                    |
| category_id       | integer    | null: false                    |
| status_id         | integer    | null: false                    | 
| payment_method_id | integer    | null: false                    |
| prefecture_id     | integer    | null: false                    |
| shipping_day_id   | integer    | null: false                    |
| selling_price     | integer    | null: false                    |
| user              | references | null: false, foreign_key: true |

# アソシエーション
belongs_to :user
has_one :order

## ordersテーブル ： 商品履歴テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

# アソシエーション
belongs_to :user
belongs_to :item
has_one :delivery

## deliveriesテーブル ： 配送先情報テーブル

| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| post_code      | string  | null: false |
| prefecture_id  | integer | null: false |
| municipality   | string  | null: false |
| house_number   | string  | null: false |
| building_name  | string  |             |
| phone_number   | string  | null: false |
| orders        | references | null: false, foreign_key: true |

# アソシエーション
belongs_to :order
