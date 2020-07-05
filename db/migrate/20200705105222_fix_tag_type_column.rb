class FixTagTypeColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :tags, :type, :category
  end
end
