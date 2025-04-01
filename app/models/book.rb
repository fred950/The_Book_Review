class Book < ApplicationRecord
  has_many :reviews, dependent: :destroy

  # Validations
  validates :title, presence: true
  validates :author, presence: true
  validates :isbn, uniqueness: true, allow_blank: true

  # ActiveStorage attachment for cover image
  has_one_attached :cover_image

  # Fetch book details from Open Library by ISBN
  def fetch_details_from_open_library
    details = BookInfoService.fetch_book_details(isbn)
    if details
      update(title: details[:title], author: details[:author])
      attach_cover_image(details[:cover_image]) if details[:cover_image]
    end
  end

  private

  # Attach the cover image if available
  def attach_cover_image(url)
    downloaded_image = URI.open(url)
    cover_image.attach(io: downloaded_image, filename: "cover_#{isbn}.jpg", content_type: "image/jpeg")
  end
end
