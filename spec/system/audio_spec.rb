require 'rails_helper'
RSpec.describe 'オーディオ管理機能', type: :system do
  let!(:user) { FactoryBot.create(:second_user) }
  let!(:project) { FactoryBot.create(:project, user: user) }
  let!(:audio) { FactoryBot.create(:audio,project: project, user: user) }
  let!(:third_user) { FactoryBot.create(:third_user) }
  let!(:join) { FactoryBot.create(:join, project: project, user: third_user) }

  describe '新規作成機能' do
    before do
      visit new_user_session_path
      fill_in 'メールアドレス', with: user.email
      fill_in 'パスワード(6文字以上)', with: user.password
      click_button "ログイン"
    end

    context 'オーディオを新規作成した場合' do
      it 'オーディオ一覧が表示される' do
        click_on "オーディオ"
        click_on "アップロード"
        fill_in 'タイトル', with: '桜'
        select('C', from: 'audio[key]')
        fill_in 'BPM', with: '200'
        fill_in 'コメント', with:'春の歌'
        attach_file 'audio[file]', Rails.root.join('spec', 'fixtures', 'sample.mp3')
        click_on '登録する'
        expect(page).to have_content '桜'
      end
    end
  end

  describe '一覧機能' do
    before do
      visit new_user_session_path
      fill_in 'メールアドレス', with: user.email 
      fill_in 'パスワード(6文字以上)', with: user.password
      click_button "ログイン"
      click_on "オーディオ"
      click_on "アップロード"
      fill_in 'タイトル', with: audio.title
      select('C', from: 'audio[key]')
      fill_in 'BPM', with: audio.bpm
      fill_in 'コメント',with: audio.comment
      attach_file 'audio[file]', Rails.root.join('spec', 'fixtures', 'sample.mp3')
      click_on '登録する'
    end

    context '特定のプロジェクトのオーディオ一覧画面に遷移した時' do
      it '登録されたオーディオ一覧画面が表示される' do
        visit projects_path
        sleep(10)
        click_on "オーディオ", match: :first
        expect(current_url).to include(audios_path)
      end
    end

    context 'オーディオ一覧画面から削除ボタンを押した時' do
      it '当該オーディオが削除された一覧画面に更新される' do
        click_on "オーディオ"
        within(".btn-group") do
          click_link "削除", match: :first
          page.accept_alert("本当に削除しますか?")
        end
        expect(current_url).to include(audios_path)
      end
    end

    context 'オーディオ一覧の編集ボタンをクリックした時時' do
      it '当該オーディオの編集画面に遷移する' do
        click_on "オーディオ"
        click_on '編集', match: :first
        expect(page).to have_content 'オーディオを編集'
      end
    end
  end

  describe '詳細機能' do

    before do
      visit new_user_session_path
      fill_in 'メールアドレス', with: user.email 
      fill_in 'パスワード(6文字以上)', with: user.password
      click_button "ログイン"
      click_on "オーディオ"
      click_on "アップロード"
      fill_in 'タイトル', with: audio.title
      select('C', from: 'audio[key]')
      fill_in 'BPM', with: audio.bpm
      fill_in 'コメント',with: audio.comment
      attach_file 'audio[file]', Rails.root.join('spec', 'fixtures', 'sample.mp3')
      click_on '登録する'
    end

    context '作成済みのオーディオをクリックした時' do
      it 'オーディオ詳細画面が表示される' do
        click_on "マイページ"
        click_on "オーディオ"
        click_on 'test'
        expect(current_url).to include(audios_path)
      end
    end

    context 'オーディオ詳細画面から削除ボタンを押した時' do
      it '当該オーディオが削除された一覧画面に遷移する' do
        click_on "マイページ"
        click_on "オーディオ"
        click_on 'test', match: :first
        within(".audio_edit_delete") do
          click_link "削除"
          page.accept_alert("本当に削除しますか?")
        end
        expect(current_url).to include(audios_path)
      end
    end

    context 'オーディオ詳細リンクの編集画面から編集した時' do
      it '当該オーディオが編集された一覧画面に遷移する' do
        click_on "マイページ"
        click_on "オーディオ"
        click_on 'test', match: :first
        click_on '編集'
        fill_in 'タイトル', with: "幽霊"
        select('F', from: 'audio[key]')
        fill_in 'BPM', with: "30"
        fill_in 'コメント',with: "お分かりいただけただろうか"
        attach_file 'audio[file]', Rails.root.join('spec', 'fixtures', 'sample.mp3')
        click_on '更新する'
        expect(page).to have_content '幽霊'
      end
    end
  end
  describe 'アクセス制限機能' do
    before do
      visit new_user_session_path
      fill_in 'メールアドレス', with: third_user.email
      fill_in 'パスワード(6文字以上)', with: third_user.password
      click_button "ログイン"
    end
  
    context '他のユーザーの楽曲を編集しようとした時' do
      it 'リダイレクトする' do
        click_on 'オーディオ'
        click_on 'test'
        visit edit_audio_path(audio)
        expect(page).to have_content '権限がありません'
      end
    end
  end
end