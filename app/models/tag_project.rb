class TagProject < ApplicationRecord
  belongs_to :project, required: true
  belongs_to :tag, required: true

  # Validations
  validates_presence_of :project_id, :tag_id
  validates_uniqueness_of :project_id, scope: :tag_id, message: "This project already has that tag."
end
