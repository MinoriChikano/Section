require 'rails_helper'

RSpec.describe 'レスポンス管理機能', type: :system do
  let!(:user) { FactoryBot.create(:second_user) }
  let!(:project) { FactoryBot.create(:project, user: user) }
  let!(:audio) { FactoryBot.create(:audio, user: user) }

  describe 'レスポンス新規投稿機能' do
    before do
      visit new_user_session_path
      fill_in 'メールアドレス', with: user.email
      fill_in 'パスワード(6文字以上)', with: user.password
      click_button "ログイン"
      click_on "メンバー一覧"
      click_on "ユーザーを追加する"
      fill_in 'メールアドレスを入力してください', with: "testtest@email.com"
      click_on '登録する'
      expect(page).to have_content "testtest@email.com"
      click_on "オーディオ"
      click_on "アップロード"
      fill_in 'タイトル', with: '桜'
      select('C', from: 'audio[key]')
      fill_in 'BPM', with: '200'
      fill_in 'コメント', with: '春の歌'
      attach_file 'audio[file]', Rails.root.join('spec', 'fixtures', 'sample.mp3')
      click_on '登録する'
    end

    context 'オーディオにレスポンスした時' do
      it '非同期通信でレスポンスした内容が反映される' do
        click_on '桜'
        fill_in 'コメント', with: 'テストコメント'
        attach_file 'response[file]', Rails.root.join('spec', 'fixtures', 'sample.mp3')
        click_on '登録する'
        sleep(5)
        expect(page).to have_content 'テストコメント'
      end
    end
  end
  describe 'レスポンス削除機能' do
    before do
      visit new_user_session_path
      fill_in 'メールアドレス', with: user.email
      fill_in 'パスワード(6文字以上)', with: user.password
      click_button "ログイン"
      click_on "メンバー一覧"
      click_on "ユーザーを追加する"
      fill_in 'メールアドレスを入力してください', with: "testtest@email.com"
      click_on '登録する'
      expect(page).to have_content "testtest@email.com"
      click_on "オーディオ"
      click_on "アップロード"
      fill_in 'タイトル', with: '桜'
      select('C', from: 'audio[key]')
      fill_in 'BPM', with: '200'
      fill_in 'コメント', with: '春の歌'
      attach_file 'audio[file]', Rails.root.join('spec', 'fixtures', 'sample.mp3')
      click_on '登録する'
      click_on '桜'
      fill_in 'コメント', with: 'テストコメント'
      attach_file 'response[file]', Rails.root.join('spec', 'fixtures', 'sample.mp3')
      click_on '登録する'
      expect(page).to have_content 'テストコメント'
    end

    context 'オーディオに投稿されたレスポンスを削除した場合' do
      it '削除されたレスポンスされたオーディオ詳細画面になる' do
        sleep (5)
        within(".response_links") do
          click_link "削除"
          page.accept_alert("本当に削除しますか?")
        end
        sleep(5)
        expect(current_url).to include(audios_path)
      end
    end

    context 'オーディオに投稿されたレスポンスを編集した場合' do
      it '非同期通信で編集が反映されたオーディオ詳細画面になる' do
        sleep (5)
        within(".response_links") do
          click_link "編集"
        end
        fill_in 'コメント', with: 'テストテストコメント'
        click_on '更新する'
        expect(current_url).to include(audios_path)
      end
    end
  end
end

