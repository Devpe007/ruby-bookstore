class Person < ApplicationRecord
  include ImageSaver

  has_secure_password

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, allow_blank: true, allow_nil: true, uniqueness: true, email: {
    message: 'está com um formato maluco'
  }
  validates :born_at, presence: true
  validate :age_limit

  # has_secure_token :password_reset_token
  validates :password_digest, presence: { on: :create }, length: { minimum: 8, allow_blank: true }

  before_save :convert_email

  scope :by_domain, ->(domain) { where('email like ?', "%@#{domain}") }
  default_scope -> { order(:name) }

  scope :admins, -> { where(admin: true) }

  has_many :books
  has_many :categories, -> { distinct }, through: :books
  has_many :orders
  has_many :orders
  has_many :order_items, through: :orders
  has_one :image, dependent: :destroy, as: :imageable

  def to_param
    "#{id}-#{name.parameterize}"
  end

  private

  def age_limit
    return unless born_at.nil? || Date.current.year - born_at.year < 16

    errors.add(:born_at, I18n.t('activerecord.errors.messages.older_than_16'))
    throw(:abort)
  end

  def convert_email
    email.downcase!
  end

  def self.auth(email, password)
    person = Person.where(email:).first
    person && person.authenticate(password) ? person : nil
  end
end
