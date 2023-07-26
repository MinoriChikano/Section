class ChangeCloumnsNotnullAddProjects < ActiveRecord::Migration[6.1]
  def change
    change_column :projects, :name, :string, null: false
  end
end
