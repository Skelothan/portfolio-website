class CreateFileProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :file_projects do |t|
      t.references :uploaded_file, foreign_key: true
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
