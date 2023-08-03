class AddProjectRefToAudios < ActiveRecord::Migration[6.1]
  def change
    add_reference :audios, :project, null: false, foreign_key: true
  end
end
