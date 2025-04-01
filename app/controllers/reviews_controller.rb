class ReviewsController < ApplicationController
  before_action :set_book

  # POST /books/:book_id/reviews
  def create
    @review = @book.reviews.new(review_params)
    if @review.save
      redirect_to @book, notice: "Review successfully created."
    else
      @reviews = @book.reviews
      render "books/show"
    end
  end

  # DELETE /books/:book_id/reviews/:id
  def destroy
    @review = @book.reviews.find(params[:id])
    @review.destroy
    redirect_to @book, notice: "Review successfully deleted."
  end

  private

  # Set the book for actions that require a book
  def set_book
    @book = Book.find(params[:book_id])
  end

  # Only allow a list of trusted parameters through
  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
