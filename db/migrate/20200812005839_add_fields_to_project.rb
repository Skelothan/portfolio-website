class AddFieldsToProject < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :short_description, :string
    add_column :projects, :thumbnail_id, :integer
    add_column :projects, :category, :string
  end
end
