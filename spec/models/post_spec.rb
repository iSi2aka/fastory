require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe 'シナリオ投稿機能' do

    context 'シナリオ投稿できる場合' do
      it 'すべての項目が正しく入力できていれば投稿できる' do
        expect(@post).to be_valid
      end 
      it 'exposureが空でも投稿できる' do
        @post.exposure = ''
        expect(@post).to be_valid
      end
      it 'othersが空でも投稿できる' do
        @post.others = ''
        expect(@post).to be_valid
      end
    end 

    context 'シナリオ投稿できない場合' do
      it 'titleが空では投稿できない' do
        @post.title = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("タイトルを入力してください")
      end
      it 'diseaseが空では投稿できない' do
        @post.disease = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("疾患名を入力してください")
      end
      it 'nameが空では投稿できない' do
        @post.name = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("患者名を入力してください")
      end
      it 'ageが空では投稿できない' do
        @post.age = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("年齢を入力してください")
      end
      it "ageが0未満では登録できない" do
        @post.age = -1
        @post.valid?
        expect(@post.errors.full_messages).to include("年齢は0以上の値にしてください")
      end
      it "ageが101以上では登録できない" do
        @post.age = 101
        @post.valid?
        expect(@post.errors.full_messages).to include("年齢は100以下の値にしてください")
      end
      it "ageが半角数字以外では登録できない" do
        @post.age = '５０'
        @post.valid?
        expect(@post.errors.full_messages).to include("年齢は数値で入力してください")
      end
      it 'sex_idが空では投稿できない' do
        @post.sex_id = 1
        @post.valid?
        expect(@post.errors.full_messages).to include("性別を入力してください")
      end
      it 'familyが空では投稿できない' do
        @post.family = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("同乗者/キーパーソンを入力してください")
      end
      it 'airwayが空では投稿できない' do
        @post.airway = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("A 気道を入力してください")
      end
      it 'breathingが空では投稿できない' do
        @post.breathing = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("B 呼吸を入力してください")
      end
      it 'circulationが空では投稿できない' do
        @post.circulation = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("C 循環を入力してください")
      end
      it 'dysfunction_cnsが空では投稿できない' do
        @post.dysfunction_cns = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("D 意識を入力してください")
      end
      it 'symptomが空では投稿できない' do
        @post.symptom = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("主訴を入力してください")
      end
      it 'allergyが空では投稿できない' do
        @post.allergy = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("アレルギーを入力してください")
      end
      it 'medicineが空では投稿できない' do
        @post.medicine = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("服薬歴を入力してください")
      end
      it 'past_historyが空では投稿できない' do
        @post.past_history = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("既往歴を入力してください")
      end
      it 'last_mealが空では投稿できない' do
        @post.last_meal = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("最終飲食を入力してください")
      end
      it 'eventが空では投稿できない' do
        @post.event = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("現病歴を入力してください")
      end
      it 'risk_factorが空では投稿できない' do
        @post.risk_factor = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("危険因子を入力してください")
      end
      it 'storyが空では投稿できない' do
        @post.story = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("院内の経過を入力してください")
      end
      it 'pointが空では投稿できない' do
        @post.point = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("評価項目を入力してください")
      end
      it 'userが紐づいていないと投稿できない' do
        @post.user = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("ログイン情報を入力してください")
      end
      it 'imagesが空だと投稿できない' do
        @post.images = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("画像を入力してください")
      end
      it 'imagesが6枚以上だと投稿できない' do
        @post = FactoryBot.build(:post) do |item|
          6.times do
            item.images.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
          end
        end
        @post.valid?
        expect(@post.errors.full_messages).to include("画像は1枚以上5枚以下にしてください")
      end
    end
  end
end
