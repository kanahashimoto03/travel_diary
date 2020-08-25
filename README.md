#　テーブル設計

## usersテーブル

| Column                 | Type       | Options     |
| ------------           | ---------- | ----------- |
| nickname               | string     | null: false |
| email                  | string     | null: false |
| password               | string     | null: false |
| password_confirmation  | string     | null: false |
| visited_countries      | text       |             |
| profile                | text       |             |

### Association
- has_many :diaries
- has_many :comments

## diariesテーブル

| Column                 | Type       | Options     |
| ------------           | ---------- | ----------- |
| country_id             | integer    | null: false |
| city                   | string     | null: false |
| category_id            | integer    | null: false |
| date                   | date       | null: false |
| recommendations        | text       | null: false |
| things_to_avoide       | text       |             |
| things_to_bring        | text       |             |
| user                   | references | null: false, foreign_key: true |

## Association
belongs_to: user
has_many: comment

## commentsテーブル

| Column                 | Type       | Options     |
| comment                | text       | null: false |
| user                   | references | null: false, foreign_key: true |
| travel_diary           | references | null: false, foreign_key: true |

## Association

belongs_to :user
belongs_to :diary
