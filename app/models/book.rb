class Book < ApplicationRecord
  validates :title, presence: true, length: { maximum: 100 }
  validates :published_at, presence: true
  validates :text, presence: true
  validates :value, presence: true, numericality: { less_than_or_equal_to: 99999999.99 }
  validates :person, presence: true

  belongs_to :person
end
