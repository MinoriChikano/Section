class CreateAudios < ActiveRecord::Migration[6.1]
  def change
    create_table :audios do |t|
      t.string :title, null: false
      t.text :comment
      t.integer :bpm
      t.string :key
      t.text :file

      t.timestamps
    end
  end
end
