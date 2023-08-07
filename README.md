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

## posts
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| title           | string     | null: false                    |
| disease         | string     | null: false                    |
| name            | string     | null: false                    |
| age             | integer    | null: false                    |
| sex             | integer    | null: false                    |
| family          | string     | null: false                    |
| airway          | string     | null: false                    |
| breathing       | string     | null: false                    |
| circulation     | string     | null: false                    |
| dysfunction_cns | string     | null: false                    |
| exposure        | string     |                                |
| symptom         | string     | null: false                    |
| allergy         | string     | null: false                    |
| medicine        | string     | null: false                    |
| past_history    | string     | null: false                    |
| last_meal       | string     | null: false                    |
| event           | string     | null: false                    |
| risk_facto      | string     | null: false                    |
| others          | string     |                                |
| story           | text       | null: false                    |
| point           | text       | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many  :comments
- has_many :chippings


## users
| Column             | Type       | Options                     |
| ------------------ | ---------- | --------------------------- |
| nickname           | string     | null: false                 |
| email              | string     | null: false, unique: true   |
| encrypted_password | string     | null: false                 |  
| department         | string     | null: false                 |

### Association
- has_many :posts
- has_many :comments
- has_many :chippings

## comments
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| comment         | text       | null: false                    |
| post            | references | null: false, foreign_key: true |
| user            | references | null: false, foreign_key: true |

### Association
- belongs_to :post
- belongs_to :user


## chippings
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| chipping        | text       | null: false                    |
| post            | references | null: false, foreign_key: true |
| user            | references | null: false, foreign_key: true |

### Association
- belongs_to :post
- belongs_to :user