class Book < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_one_attached :cover_image  # This line adds the cover image functionality

  validates :title, presence: true
  validates :author, presence: true
  validates :isbn, uniqueness: true, allow_blank: true

  # Method to calculate average rating of the book
  def average_rating
    return 0 if reviews.empty?
    reviews.average(:rating).to_f.round(1)
  end
end
