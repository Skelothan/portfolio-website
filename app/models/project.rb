class Project < ApplicationRecord
    has_many :tag_projects
    has_many :tags, through: :tag_project
    has_many :links
    has_many :file_projects
    has_many :uploaded_files, through: :file_project

    # Validations
    validates_presence_of :name, :start_date, :active
    validates_date :start_date
    validates_date :end_date, on_or_after: :start_date

    # Scopes
    scope :alphabetical,    lambda {order(:name)}
    scope :chronological,   lambda {order(:start_date, :end_date)}
    scope :for_tag,         lambda {|t| joins(:tag).where('tag.name = ?', "#{t}%")}
    scope :untagged,        lambda {where('id NOT IN (?)', Tag_Project.map{|t| t.project_id})}
    scope :current,         lambda {where('end_date IS NULL')}
    scope :completed,       lambda {where('end_date IS NOT NULL')}
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

    # Return a string showing the date range of this project. e.g. September 2016 – December 2017, May 2020 – present
    def date_range()
        return (self.start_date.strftime("%B %Y") + " – " + ((self.end_date and self.end_date.strftime("%B %Y")) or "present"))
    end

    def num_tags()
        return self.tags.size
    end

    def num_files()
        return self.uploaded_files.size
    end

    def num_links()
        return self.links.size
    end

    def has_tags?()
        return (self.num_tags > 0)
    end

    def has_files?()
        return (self.num_files > 0)
    end

    def has_links?()
        return (self.num_links > 0)
    end


end
