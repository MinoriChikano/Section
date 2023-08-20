require 'rails_helper'

RSpec.describe "レスポンスモデル機能", type: :model do
  describe 'バリデーションのテスト' do
    context 'レスポンス名が空の場合' do
      it 'バリデーションにひっかかる' do
        response = FactoryBot.build(:response, comment: "")
        expect(response).to be_invalid
      end
    end
    context '適切なレスポンス名の場合' do
      it 'バリデーションを通過する' do
        response = FactoryBot.build(:response, comment: "テスト")
        expect(response).to be_valid
      end
    end
  end

  # describe 'バリデーションのテスト' do
  #   context 'レスポンス名が空の場合' do
  #     it 'バリデーションにひっかかる' do
  #       response = FactoryBot.build(:response, comment: "テスト")
  #       expect(response).to be_invalid
  #     end
  #   end
  #   context '適切なレスポンス名の場合' do
  #     it 'バリデーションを通過する' do
  #       response = FactoryBot.build(:response, comment: "")
  #       expect(response).to be_valid
  #     end
  #   end
  # end
end