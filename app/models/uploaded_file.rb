class UploadedFile < ApplicationRecord
    mount_uploader :cw_file, CWFileUploader

    has_many :file_project
    has_many :project, through: :file_project # Realistically, I don't expect the same file to apply to more than one project... but hey, you never know
    has_many :project_thumbnail, class_name: "Project", foreign_key: "thumbnail_id"

    # Validations
    validates_presence_of :name, :media_type, :cw_file, :upload_date
    validates_date :upload_date, on_or_before: 0.days.ago
    validates_inclusion_of :media_type, in: %w[document image audio video executable archive other], message: "Not a valid media type."

    # Scopes
    scope :alphabetical,    lambda {order(:name)}
    scope :chronological,   lambda {order(:upload_date)}
    scope :has_media_type,  lambda {|t| where("media_type = ?", "#{t}")}
    scope :not_media_type,  lambda {|t| where("media_type != ?", "#{t}")}
    scope :active,          lambda {where(active: true)}
    scope :inactive,        lambda {where(active: false)}

    # Callbacks
    after_create :set_upload_date 
    before_destroy do
        check_destroyable?
        if errors.present? then throw(:abort) end
    end

    # Methods
    def activate()
        self.active = true
        self.save!
    end

    def deactivate()
        self.active = false
        self.save!
    end

    def set_upload_date()
        self.upload_date = Date.current
        self.save!
    end
    
    def url()
        self.cw_file.url
    end

    private
        def check_destroyable?()
            unless self.project.size == 0 then
                errors.add(:base, "This file cannot be deleted because it's currently being used by one or more projects. You should deactivate it instead.")
            end
        end

end
