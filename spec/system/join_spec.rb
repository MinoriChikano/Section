require 'rails_helper'
RSpec.describe 'ジョイン管理機能', type: :system do
    let!(:user) { FactoryBot.create(:second_user) }
    let!(:project) { FactoryBot.create(:project, user: user) }
    let!(:audio) { FactoryBot.create(:audio, user: user) }
  describe 'ユーザ参加機能' do
    before do
      visit new_user_session_path
      fill_in 'メールアドレス', with: user.email
      fill_in 'パスワード(6文字以上)', with: user.password
      click_button "ログイン"
    end

    context '他のユーザをプロジェクトに新規参加させた場合' do
      it '当該ユーザー情報が追加され、プロジェクト詳細画面が表示される' do
        click_on "メンバー一覧"
        click_on "ユーザーを追加する"
        fill_in 'メールアドレスを入力してください', with: "testtest@email.com" 
        click_on '登録する'
        expect(page).to have_content "testtest@email.com" 
      end
    end

    context '登録済みのユーザをプロジェクトに新規参加させた場合' do
      it '当該ユーザー情報が追加され図、プロジェクト詳細画面にリダイレクトする' do
        click_on "メンバー一覧"
        click_on "ユーザーを追加する"
        fill_in 'メールアドレスを入力してください', with: "testtest@email.com" 
        click_on '登録する'
        sleep(4)
        click_on "ユーザーを追加する"
        fill_in 'メールアドレスを入力してください', with: "testtest@email.com" 
        click_on '登録する'
        sleep(4)
        expect(page).to have_content "testtest@email.com" 
      end
    end

    context 'オーナーであるユーザー自身をプロジェクトに新規参加させようとした場合' do
      it 'ユーザーは追加されず、プロジェクト詳細画面にリダイレクトする' do
        click_on "メンバー一覧"
        sleep(5)
        click_on "ユーザーを追加する"
        fill_in 'メールアドレスを入力してください', with: "test2@email.com" 
        click_on '登録する'
        expect(page).to have_content "test2@email.com"
      end
    end
  end
end