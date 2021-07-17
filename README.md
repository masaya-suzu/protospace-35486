# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false |
| password           | string | null: false |
| name               | string | null: false |
| profile            | text   | null: false |
| occupation         | text   | null: false |
| position           | text   | null: false |

### Association

- has_many :prototypes
- has_many :comments

## prototypes テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| title              | string     |                                |
| catch_copy         | text       |                                |
| concept            | text       |                                |
| user               | references | null: false, foreign_key: ture |

### Association

- has_many :comments
- belongs_to :users

## comments テーブル

| Column                  | Type       | Options                        |
| ----------------------- | ---------- | ------------------------------ |
| text                    | text       |                                |
| user                    | references | null: false, foreign_key: ture |
| prototype               | references | null: false, foreign_key: ture |

### Association

- belongs_to :comments
- belongs_to :users