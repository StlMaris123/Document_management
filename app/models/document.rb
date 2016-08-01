class Document < ApplicationRecord
  validates :title,  presence: true, length: { minimum: 3 }
  validates :link, presence: true
  validates_format_of :link, :with => URI.regexp
  validates :tag, presence: true, length: { minimum: 3 }
  validates :department, presence: true
  CLASS_LIST = ["Operations", "Finance", "IT", "Marketing", "Credit"]

  def self.search(search)
    where("title LIKE ?", "%#{search}%")
  end
end
