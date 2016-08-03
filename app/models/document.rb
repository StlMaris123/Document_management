class Document < ApplicationRecord
  belongs_to :user
  validates :title,  presence: true, length: { minimum: 3 }
  validates :link, presence: true
  validates_format_of :link, :with => URI.regexp
  validates :tag, presence: true, length: { minimum: 3 }
  validates :department, presence: true
  CLASS_LIST = ["Operations", "Finance", "IT", "Marketing", "Credit"]

  def self.search(search)
    where("title LIKE ?", "%#{search}%")
    where("tag LIKE ?", "%#{search}%")
  end
end
