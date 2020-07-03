class Link < ApplicationRecord
    belongs_to :project

    # Validations
    validates_presence_of :name, :url
    validates_uniqueness_of :url, scope: :project_id, message: "This project already has that link."

    # Scopes
    scope :for_project,     lambda {|p| where('project_id = ?', p.id)}
    scope :active,          lambda {where(active: true)}
    scope :inactive,        lambda {where(active: false)}

    # Methods
    def activate()
        self.active = true
        self.save!
    end

    def deactivate()
        self.active = false
        self.save!
    end
end
