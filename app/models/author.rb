class Author < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates_presence_of :name
  validates :email, uniqueness: true
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }

  has_and_belongs_to_many :books
end
