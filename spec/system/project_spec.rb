require 'rails_helper'

RSpec.describe 'プロジェクト管理機能', type: :system do
  describe '新規プロジェクト作成機能' do
    context 'プロジェクトを新規作成した場合' do
      it 'プロジェクトが作成され、一覧画面に表示される' do
        visit new_user_session_path
        click_on 'ゲストはこちら'
        click_on '+プロジェクト'
        fill_in 'プロジェクト名', with: "テストバンド"
        click_on "作成する"
        expect(page).to have_content 'テストバンド'
      end
    end
  end
  describe '既存のプロジェクト削除機能' do
    context 'プロジェクトを削除した場合' do
      it '当該プロジェクトが削除された状態で一覧画面が表示される' do
        visit new_user_session_path
        click_on 'ゲスト管理者はこちら'
        click_on '+プロジェクト'
        fill_in 'プロジェクト名', with: "テストバンド"
        click_on "作成する"
        click_on "メンバー一覧"
        within(".project_bt_container") do
          click_link "プロジェクトを削除する"
          page.accept_alert("プロジェクトを削除してもよろしいですか？")
        end
        expect(current_url).to include(projects_path)
      end
    end
  end
end