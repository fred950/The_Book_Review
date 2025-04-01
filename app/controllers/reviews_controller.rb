class ReviewsController < ApplicationController
  before_action :set_book

  def create
    @review = @book.reviews.build(review_params)
    if @review.save
      redirect_to @book, notice: "Review was successfully created."
    else
      redirect_to @book, alert: "Unable to create review."
    end
  end

  def destroy
    @review = @book.reviews.find(params[:id])
    @review.destroy
    redirect_to @book, notice: "Review was successfully deleted."
  end

  private
    def set_book
      @book = Book.find(params[:book_id])
    end

    def review_params
      params.require(:review).permit(:rating, :content)
    end
end
