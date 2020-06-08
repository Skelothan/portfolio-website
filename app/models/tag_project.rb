class TagProject < ApplicationRecord
  belongs_to :project
  belongs_to :tag

  # Validations
  validates_uniqueness_of :project_id, scope: :tag_id, message: "This project already has that tag."
end
