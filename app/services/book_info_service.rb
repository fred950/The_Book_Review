require "httparty"

class BookInfoService
  include HTTParty
  base_uri "https://openlibrary.org/api/books"

  def self.fetch_book_details(isbn)
    response = get("", query: { bibkeys: "ISBN:#{isbn}", format: "json", jscmd: "data" })

    if response.success?
      book_data = response["ISBN:#{isbn}"]
      {
        title: book_data["title"],
        author: book_data["authors"].first["name"],
        cover_image: book_data.dig("cover", "medium") || book_data.dig("cover", "large")
      }
    else
      nil
    end
  rescue StandardError => e
    Rails.logger.error "Error fetching book details: #{e.message}"
    nil
  end
end
