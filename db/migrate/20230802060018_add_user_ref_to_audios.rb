class AddUserRefToAudios < ActiveRecord::Migration[6.1]
  def change
    add_reference :audios, :user, null: false, foreign_key: true
  end
end
