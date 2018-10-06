class Book < ActiveRecord::Base
  validates_presence_of :title, :isbn, :number_of_pages
  validates :isbn, uniqueness: true

  has_and_belongs_to_many :authors

  before_save :downcase_isbn

  def downcase_isbn
    self.isbn.downcase!
  end
end
