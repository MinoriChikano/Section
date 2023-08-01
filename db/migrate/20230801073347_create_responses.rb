class CreateResponses < ActiveRecord::Migration[6.1]
  def change
    create_table :responses do |t|
      t.references :audio, null: false, foreign_key: true
      t.text :comment, null: false
      t.text :file

      t.timestamps
    end
  end
end
