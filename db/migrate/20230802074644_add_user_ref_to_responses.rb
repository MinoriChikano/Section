class AddUserRefToResponses < ActiveRecord::Migration[6.1]
  def change
    add_reference :responses, :user, null: false, foreign_key: true
  end
end
