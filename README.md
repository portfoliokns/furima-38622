# テーブル設計

## users テーブル ： ユーザー管理テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| first_name         | string  | null: false |
| last_name          | string  | null: false |
| first_name_kana    | string  | null: false |
| last_name_kana     | string  | null: false |
| birth_year         | integer | null: false |
| birth_month        | integer | null: false |
| birth_day          | integer | null: false |


##  itemsテーブル ： 商品出品テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | -------------------------------|
| name           | string     | null: false                    |
| description    | text       | null: false                    |
| category       | string     | null: false                    |
| status         | string     | null: false                    |
| payment_method | string     | null: false                    |
| shipping_area  | string     | null: false                    |
| shipping_days  | string     | null: false                    |
| selling_price  | integer    | null: false                    |
| user           | references | null: false, foreign_key: true |

## purchases テーブル ： 商品購入テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |