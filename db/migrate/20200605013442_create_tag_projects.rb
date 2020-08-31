class CreateTagProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :tag_projects do |t|
      t.references :project, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
