class UploadedFile < ApplicationRecord
    has_many :file_project
    has_many :project, through: :file_project # Realistically, I don't expect the same file to apply to more than one project... but hey, you never know

    # Validations
    validates_presence_of :name, :url, :media_type, :upload_date, :active
    validates_uniqueness_of :url, message: "A file with that name exists already."
    validates_date :upload_date, on_or_before: Date.current
    validates_inclusion_of :media_type, in: %w[document image audio video executable archive other], message: "Not a valid media type."

    # Scopes
    scope :alphabetical,    lambda {order(:name)}
    scope :by_filename,     lambda {order(:url)}
    scope :chronological,   lambda {order(:upload_date)}
    scope :has_media_type,  lambda {|t| where("media_type = ?", "#{t}%")}
    scope :active,          lambda {where(active: true)}
    scope :inactive,        lambda {where(active: false)}

    # Callbacks
    after_create :set_upload_date
    before_destroy do
        self.check_destroyable?
        if errors.present? then throw(:abort) end
    end
    after_rollback :deactivate

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

    private
        def check_destroyable?()
            unless self.projects.size == 0 then
                errors.add(:base, "This file cannot be deleted because it's currently being used by one or more projects. It has been set to inactive instead.")
            end
        end

end
