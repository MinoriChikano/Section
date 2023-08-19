require 'rails_helper'

RSpec.describe "プロジェクトモデル機能", type: :model do
  describe 'バリデーションのテスト' do
    context 'プロジェクト名が空の場合' do
      it 'バリデーションにひっかかる' do
        project = FactoryBot.build(:project, name: "")
        expect(project).to be_invalid
      end
    end

    context 'プロジェクト名が30文字以上の場合' do
      it 'バリデーションにひっかかる' do
        project = FactoryBot.build(:project, name: "じゅげむじゅげむごこうのすりきれかいじゃりすいぎょのすいぎょうまつうんらいまつふうらいまつくうねるところにすむところやぶらこうじのぶらこうじぱいぽぱいぽぱいぽのしゅーりんがんしゅーりんがんのぐーりんだいぐーりんだいのぽんぽこぴーのぽんぽこなのちょうきゅうめいのちょうすけ")
        expect(project).to be_invalid
      end
    end

    context '適切なプロジェクト名の場合' do
      it 'バリデーションを通過する' do
        project = FactoryBot.build(:project, name: "テスト")
        expect(project).to be_valid
      end
    end
  end
end
