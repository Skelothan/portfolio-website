class FileProject < ApplicationRecord
  belongs_to :file
  belongs_to :project
end
