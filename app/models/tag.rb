class Tag < ApplicationRecord
    has_many :tag_projects
    has_many :projects, through: :tag_project

    # Validations
    validates_presence_of :name, :category, :active
    validates_uniqueness_of :name

    # Scopes
    scope :by_name,     lambda {order('name')}
    scope :by_category,     lambda {order('category')}
    scope :for_category,    lambda {|t| where('category = ?', "#{t}%")}
    scope :search,      lambda {|t| where('name LIKE ?', "#{t}%")}
    scope :active,      lambda {where(active: true)}
    scope :inactive,    lambda {where(active: false)}

    # Callbacks
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

    private
        def check_destroyable?()
            unless self.projects.size == 0 then
                errors.add(:base, "This tag cannot be deleted because it's currently being used by one or more projects. It has been set to inactive instead.")
            end
        end
end
