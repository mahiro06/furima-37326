# README

# テーブル設計

## usersテーブル
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |
| birth              | date   | null: false               |

### Association

- has_many :items
- has_many :rops
- has_many :addresses

## itemsテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item_name          | string     | null: false                    |
| item_info          | text       | null: false                    |
| category           | string     | null: false                    |
| quality            | text       | null: false                    |
| shipping_area      | string     | null: false                    |
| shipping_date      | string     | null: false                    |
| load               | string     | null: false                    |
| price              | integer    | null: false                    |
| user_id            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :address
- has_one  :rop

## ropsテーブル
| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| item_id    | references | null: false, foreign_key: true |
| user_id    | references | null: false, foreign_key: true |
| address_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :address

## addressesテーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postal_cord      | string     | null: false                    |
| prefectures      | string     | null: false                    |
| city             | string     | null: false                    |
| building_address | string     | null: false                    |
| building         | string     |                                |
| tell             | string     | null: false                    |
| item_id          | references | null: false, foreign_key: true |
| user_id          | references | null: false, foreign_key: true |

### Association

- has_many :items
- belongs_to :user
- belongs_to :prototype