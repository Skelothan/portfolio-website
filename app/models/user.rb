class User < ApplicationRecord
    has_secure_password

    # Validations
    validates_presence_of :username
    validates_uniqueness_of :username
    validates_presence_of :password, on: :create
    validates_presence_of :password_confirmation , on: :create
    validates_confirmation_of :password, message: "does not match confirmation"
    validates_inclusion_of :authority, in: %w(webmaster), message: "is not a valid role"

    # Methods
    # For use with CanCan
    ROLES = [['Webmaster', :webmaster]]
    def role?(authorized_role)
        if self.authority.nil? then return false end
        return self.authority.downcase.to_sym == authorized_role
    end

    # Login
    def self.authenticate(username, password)
        find_by_username(username).try(:authenticate, password)
    end
end
