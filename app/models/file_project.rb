class FileProject < ApplicationRecord
  belongs_to :uploaded_file
  belongs_to :project

  # Validations
  validates_presence_of :project_id, :uploaded_file_id
  validates_uniqueness_of :project_id, scope: :uploaded_file_id, message: "This project already has that file."
end
