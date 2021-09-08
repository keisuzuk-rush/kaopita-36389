# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| name               | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| company_number     | integer | null: false |

### Association

- has_many :plans
- has_many :faces
- has_many :room_users
- has_many :rooms, through: :room_users

## plans テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| plan   | string     | null: false                    |
| date   | date       | null: false                    |
| user   | references | null: false, foreign_key: true |
| face   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :face

## faces テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| text       | string     | null: false                    |
| department | string     | null: false                    |
| skill      | string     | null: false                    |
| user       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many   :plans

## tweets テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| text   | string     | null: false                    |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :room

## rooms テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| name   | string     | null: false                    |

### Association

- has_many :room_users
- has_many :user, through: :room_users

## room_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :room