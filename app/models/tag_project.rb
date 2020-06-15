class TagProject < ApplicationRecord
  belongs_to :project
  belongs_to :tag

  # Validations
  validates_presence_of :project_id, :tag_id
  validates_uniqueness_of :project_id, scope: :tag_id, message: "This project already has that tag."
end
