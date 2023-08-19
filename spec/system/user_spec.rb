require 'rails_helper'

RSpec.describe 'ユーザ管理機能', type: :system do
  describe 'ユーザ新規登録' do
    context 'ユーザを新規作成した場合' do
      it '新規登録できる' do
        visit new_user_registration_path
        fill_in 'user[name]', with: 'user1'
        fill_in 'user[email]', with: 'user1@test.com'
        fill_in 'user[password]', with: '123456'
        fill_in 'user[password_confirmation]', with: '123456'
        click_button '登録'
        expect(current_url).to include(projects_path)
      end
    end

    context 'ログインせず一覧画面に飛ぼうとした時' do
      it 'ログイン画面へ飛ぶ' do
        visit projects_path
        expect(current_path).to eq new_user_session_path
      end
    end
  end

  describe 'ログイン機能に関するテスト' do
    before do
      @user=FactoryBot.create(:user)
    end
    context 'ログインしようとした時' do
      it 'ログインし、自身のプロジェクト一覧画面へ遷移する' do
        visit new_user_session_path
        fill_in 'メールアドレス', with: @user.email
        fill_in 'パスワード(6文字以上)', with: @user.password
        click_button "ログイン"
        expect(current_url).to include(projects_path)
      end
    end
    context 'ログインしている時' do
      before do
        visit new_user_session_path
        fill_in 'メールアドレス', with: @user.email
        fill_in 'パスワード(6文字以上)', with: @user.password
        click_button "ログイン"
      end
      it 'アカウントの詳細に飛べる' do
        click_on "アカウント"
        expect(current_path).to eq users_show_path
      end
      it '編集できる' do
        click_on "アカウント"
        click_on "アカウント情報を編集"
        fill_in '名前', with: "テスト変更"
        fill_in 'メールアドレス', with: "test2@email.com"
        fill_in '新しいパスワード', with: "654321"
        fill_in '新しいパスワード(確認用)',with: "654321"
        fill_in '現在のパスワード', with: "123456"
        click_button "更新"
        expect(current_url).to include(users_show_path)
      end
    end
  end
end
