require 'rails_helper'

RSpec.describe "ユーザーモデル機能", type: :model do
  describe 'バリデーションのテスト' do
    context 'ユーザー名が空の場合' do
      it 'バリデーションにひっかかる' do
        user = FactoryBot.build(:user, name: "")
        expect(user).to be_invalid
      end
    end

    context 'ユーザー名が30文字以上の場合' do
      it 'バリデーションにひっかかる' do
        user = FactoryBot.build(:user, name: "じゅげむじゅげむごこうのすりきれかいじゃりすいぎょのすいぎょうまつうんらいまつふうらいまつくうねるところにすむところやぶらこうじのぶらこうじぱいぽぱいぽぱいぽのしゅーりんがんしゅーりんがんのぐーりんだいぐーりんだいのぽんぽこぴーのぽんぽこなのちょうきゅうめいのちょうすけ")
        expect(user).to be_invalid
      end
    end

    context '適切な名前の場合' do
      it 'バリデーションを通過する' do
        user = FactoryBot.build(:user, name: "テスト")
        expect(user).to be_valid
      end
    end

    context 'メールアドレスが空の場合' do
      it 'バリデーションに引っかかる' do
        user = FactoryBot.build(:user, email: "")
        expect(user).to be_invalid
      end
    end

    context 'メールアドレスが適切に入力されている場合' do
      it 'バリデーションを通過する' do
        user = FactoryBot.build(:user, email: "test@email.com")
        expect(user).to be_valid
      end
    end
  end

  describe '失敗テスト' do
    context 'ユーザー名が空の場合' do
      it 'バリデーションにひっかかる' do
        user = FactoryBot.build(:user, name: "テスト")
        expect(user).to be_invalid
      end
    end

    context 'ユーザー名が30文字以上の場合' do
      it 'バリデーションにひっかかる' do
        user = FactoryBot.build(:user, name: "かいじゃりすいぎょの失敗")
        expect(user).to be_invalid
      end
    end

    context '適切な名前の場合' do
      it 'バリデーションを通過する' do
        user = FactoryBot.build(:user, name: "")
        expect(user).to be_valid
      end
    end

    context 'メールアドレスが空の場合' do
      it 'バリデーションに引っかかる' do
        user = FactoryBot.build(:user, email: "test@email.com")
        expect(user).to be_invalid
      end
    end

    context 'メールアドレスが適切に入力されている場合' do
      it 'バリデーションを通過する' do
        user = FactoryBot.build(:user, email: "test")
        expect(user).to be_valid
      end
    end
  end
end
