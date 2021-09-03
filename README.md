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
- has_many :tweets

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
- has_many :plans
- has_many :tweets

## tweets テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| name   | string     | null: false                    |
| text   | string     | null: false                    |
| user   | references | null: false, foreign_key: true |
| face   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :face
