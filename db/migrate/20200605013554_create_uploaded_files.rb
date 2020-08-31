class CreateUploadedFiles < ActiveRecord::Migration[5.2]
  def change
    create_table :uploaded_files do |t|
      t.string :name
      t.string :url
      t.string :media_type
      t.date :upload_date
      t.boolean :active

      t.timestamps
    end
  end
end
