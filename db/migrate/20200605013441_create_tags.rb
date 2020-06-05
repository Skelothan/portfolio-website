class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.string :name
      t.string :type
      t.boolean :active

      t.timestamps
    end
  end
end
