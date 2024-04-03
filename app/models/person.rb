class Person < ApplicationRecord
    validates :name, presence: true, length: { maximum: 50 }
    validates :email, allow_blank: true, allow_nil: true, uniqueness: true, email: {
        message: 'está com um formato maluco'
    }
    validates :born_at, presence: true
    validate :age_limit

    has_secure_token
    has_secure_password :password_reset_token
    validates :password, presence: { on: :create }, length: { minimum: 8, allow_blank: true }

    before_save :convert_email

    scope :by_domain, -> (domain) { where("email like ?", "%@#{domain}") }
    default_scope -> { order(:name) }

    scope :admins, -> () { where(admin: true) }

    def to_param 
        "#{id}-#{name.parameterize}"
    end
    
    private

    def age_limit
        if self.born_at.nil? || Date.current.year - self.born_at.year < 16
            errors.add(:born_at, I18n.t('activerecord.errors.messages.older_than_16'))
            throw(:abort)
        end
    end

    def convert_email
        email.downcase!
    end

    def self.auth(email, password)
        person = Person.where(email: email).first
        person && person.authenticate(password) ? person : nil
    end
end
