require 'rails_helper'

RSpec.describe "オーディオモデル機能", type: :model do
  describe 'バリデーションのテスト' do
    context 'タイトルが空の場合' do
      it 'バリデーションにひっかかる' do
        audio = FactoryBot.build(:audio, title: "")
        expect(audio).to be_invalid
      end
    end

    context 'タイトルが30文字以上の場合' do
      it 'バリデーションにひっかかる' do
        audio = FactoryBot.build(:audio, title: "じゅげむじゅげむごこうのすりきれかいじゃりすいぎょのすいぎょうまつうんらいまつふうらいまつくうねるところにすむところやぶらこうじのぶらこうじぱいぽぱいぽぱいぽのしゅーりんがんしゅーりんがんのぐーりんだいぐーりんだいのぽんぽこぴーのぽんぽこなのちょうきゅうめいのちょうすけ")
        expect(audio).to be_invalid
      end
    end

    context '適切なタイトルの場合' do
      it 'バリデーションを通過する' do
        audio = FactoryBot.build(:audio, title: "テスト")
        expect(audio).to be_valid
      end
    end
  
    context 'BPMが文字列の場合' do
      it 'バリデーションにひっかかる' do
        audio = FactoryBot.build(:audio, bpm: "テスト")
        expect(audio).to be_invalid
      end
    end

    context 'BPMが30を下回る数値の場合' do
      it 'バリデーションにひっかかる' do
        audio = FactoryBot.build(:audio, bpm: "29")
        expect(audio).to be_invalid
      end
    end

    context 'BPMが255を上回る数値の場合' do
      it 'バリデーションにひっかかる' do
        audio = FactoryBot.build(:audio, bpm: 256)
        expect(audio).to be_invalid
      end
    end

    context 'BPMが空白の場合' do
      it 'バリデーションが通る' do
        audio = FactoryBot.build(:audio, bpm: "")
        expect(audio).to be_valid
      end
    end

    context 'BPMが適切な数値の場合' do
      it 'バリデーションが通る' do
        audio = FactoryBot.build(:audio, bpm: 30)
        expect(audio).to be_valid
      end
    end
  end
end
