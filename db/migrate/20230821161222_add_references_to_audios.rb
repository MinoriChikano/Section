class AddReferencesToAudios < ActiveRecord::Migration[6.1]
  def change
    add_column :audios, :reference, :text
  end
end
