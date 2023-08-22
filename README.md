# README

# アプリケーション名	
  fastory

# アプリケーション概要	
  ### シナリオ作成負担軽減・質向上
  - 作成過程をテンプレート化することで作業負担を軽減する。
  - 過去に作成したシナリオを即時に実施することができる。
  - シナリオ作りが上手な人を真似ることができ、シナリオの質が向上する。
  ### シナリオ管理
  - 個別で作成・管理していたシナリオを、データベース上の管理に統一することで、過去のものを含め検索が容易になる。
  ### 知識・技術向上
  - 過去のシナリオをいつでも見返すことができ、反省に活かすことができる。
  - 同じシナリオを反復実施することができ、同種の知識の定着を図ることができる。

# URL	
  https://fastory.onrender.com

# テスト用アカウント	
- Basic認証 ID：fast
- Basic認証 パスワード：3256
- ユーザーメールアドレス：
- ユーザーパスワード：

# 利用方法	
  ### シナリオ作成
  - メニューの「NEW」をクリックすると、シナリオ作成画面に遷移します。未ログイン状態だと、ログイン画面に遷移する。
  - 「必須」マークがついている箇所は記入が必須。
  - 「院内の経過」の記入欄上部の「VS コピー」をクリックすると、バイタルサインを記入するためのテンプレートをコピーすることができる。
  ### シナリオ閲覧
  - トップページに一覧表示されているシナリオのタイトルをクリックすると、シナリオの詳細を閲覧することができる。
  - シナリオ詳細画面にて、右側のメニューにあるアイコンをクリックすると登録されている画像を表示することができる。
  ### シナリオ編集・削除
  - シナリオ詳細画面にて、投稿者本人のみ右側のメニュー欄の「編集」と「削除」ボタンが表示される。
  ### シナリオ検索
  - メニューの検索欄にシナリオのタイトルを入力すると、該当するシナリオが一覧表示される。
  ### コメント投稿・閲覧
  - ログイン時のみ、右側のメニューに「シナリオを実施する」リンクが表示され、それをクリックすることでコメント(シナリオ実施についての評価)を記入する画面に遷移する。
  - あらかじめ記入した左側の「評価ポイント」に沿って、実施者が手技を行えているか評価し、下の欄に記入する。
  - 「投稿する」ボタンを押すと内容が保存される(空欄だと保存できず表示が変化しない)。
  ### コメント編集・削除
  - コメント詳細画面にて、投稿者本人のみコメント下に「編集」と「削除」ボタンが表示される。
  
# アプリケーションを作成した背景	
  ### 対象
  某大学の某サークルに所属する看護学生。このサークルでは学生自身で作成した講義やシナリオ実施を通して、救急医療を学習している。
  ### 対象者の課題
  - シナリオ(実際の医療現場を想定した設定)を作成するのが手間。
  - シナリオの管理が作成した学生によって異なる(Googleドライブに共有する、自分のPCのみに保存 など)。
  - 一度実施したシナリオを再実施、見直すことが基本的にない(シナリオ管理場所が統一されていないことに起因する)。

# 洗い出した要件	
  https://docs.google.com/spreadsheets/d/10VYZkj5GjLlgyt_4El4MQwUEDfb_zEXIk74_w4pe2lQ/edit#gid=982722306

# 実装した機能についての画像やGIFおよびその説明
  - https://gyazo.com/f5a429edf926d252062f3dd96770905b  一覧表示からシナリオ詳細表示
  - https://gyazo.com/553a51170c79a2f20702798e0f261c0b  詳細表示から画像表示、コメント詳細表示
  - https://gyazo.com/5d8f0e2e5cf2c99bef50a32752950d7f  シナリオ削除
  - https://gyazo.com/bc4852bdb557bcd1050a9d093d6c53d0  検索機能
  - https://gyazo.com/e6ee46e4001d4559793866d2da76a2ca  テンプレートのコピー機能
  - https://gyazo.com/d7fedd9f9627b52f4b103552048bd0c0  画像プレビュー機能

# 実装予定の機能	
- 作成途中のシナリオを一時保存できる機能

# データベース設計	
  ![ER図](https://gyazo.com/556a506dde78372291dddc903547e0eb)

# 画面遷移図	
  ![画面遷移図](https://gyazo.com/974fe913535a858d6e2a3cece8c983fa)

# 開発環境	
- フレームワーク：Ruby on rails ver.7
- 言語：Ruby, JS, HTML, CSS

# ローカルでの動作方法	
  git clone https://github.com/iSi2aka/fastory.git

# 工夫したポイント	
  ### 制作背景
  学生時代、自分が所属していたサークル活動で得た知識によって、看護師として就職してからかの学習をかなり優位に進められた原体験があった。サークル活動の主軸であるシナリオ実施について、管理体制を整えることでより生産的なサークル活動が展開できると考えた。看護師として就職する際に、学生に自分以上の知識面でのアドバンテージをもってもらいたいと考えた。
  ### 使用技術
  - Rubyを用いた条件分岐：ログインの有無によって表示を変更
  - Ruby on rails turboメソッド：シナリオやコメント削除の際にアラートを表示
  - JSを用いたコピー機能：長文のテンプレートをボタンクリックでコピーする機能を実装
  - JSを用いた画像プレビュー機能：画像選択の際の視認性を向上
  - CSS hoverセレクターで表示文字色を変更：リンクや送信ボタンを装飾し視認性を向上
  ### タスク管理
  - GitHub プロジェクトボードを使用し、要件ごとにissueを作成

# 改善点	
- シナリオ作成には時間を要するため、作成途中のものを一時保存できる機能が必要。
- スマホでも利用できるように、レスポンシブ対応する。

# 制作時間	
- 企画・構想、環境構築：10h
- バックエンド実装：40h
- フロントエンド装飾：50h
(1日作業時間8～9h)


## posts
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| title           | string     | null: false                    |
| disease         | string     | null: false                    |
| name            | string     | null: false                    |
| age             | integer    | null: false                    |
| sex_id          | integer    | null: false                    |
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
| risk_factor     | string     | null: false                    |
| others          | string     |                                |
| story           | text       | null: false                    |
| point           | text       | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many  :comments


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


## comments
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| comment         | text       | null: false                    |
| post            | references | null: false, foreign_key: true |
| user            | references | null: false, foreign_key: true |

### Association
- belongs_to :post
- belongs_to :user
