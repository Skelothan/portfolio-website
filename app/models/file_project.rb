class FileProject < ApplicationRecord
  belongs_to :uploaded_file, required: true
  belongs_to :project, required: true

  # Validations
  validates_presence_of :project_id, :uploaded_file_id
  validates_uniqueness_of :project_id, scope: :uploaded_file_id, message: "This project already has that file."
end
