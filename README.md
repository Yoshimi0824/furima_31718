# テーブル設計

## users テーブル
| Column          | Type   | Options      |
| --------------- | ------ | ------------ |
| nickname        | string | null: false  |
| email           | string | unique: true |
| password        | string | null: false  |
| last_name       | string | null: false  |
| first_name      | string | null: false  |
| last_name_kana  | string | null: false  |
| first_name_kana | string | null: false  |
| birthday        | date   | null: false  |

### Association

- has_many :items
- has_many :purchases



## items テーブル
| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| product      | string     | null: false                    |
| explanation  | text       | null: false                    |
| category     | string     | null: false                    |
| condition    | string     | null: false                    |
| shipping_fee | string     | null: false                    |
| sender       | string     | null: false                    |
| days_to_ship | string     | null: false                    |
| user_id      | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_one :purchase



## purchase　テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| item_id     | references | null: false, foreign_key: true |
| user_id     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :address



## address テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| postal_code     | integer    | null: false                    |
| prefecture      | string     | null: false                    |
| municipality    | string     | null: false                    |
| street_number   | string     | null: false                    |
| building_name   | string     |                                |
| phone_number    | integer    | null: false                    |
| purchase_id     | references | null: false, foreign_key: true |

### Association

- has_many :purchases