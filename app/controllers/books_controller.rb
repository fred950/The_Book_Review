class BooksController < ApplicationController
  before_action :set_book, only: [ :show, :edit, :update, :destroy ]

  # GET /books
  def index
    @books = Book.all
  end

  # GET /books/:id
  def show
    @review = Review.new
    @reviews = @book.reviews
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # POST /books
  def create
    @book = Book.new(book_params)

    # Optionally lookup book details via Open Library API by ISBN
    if @book.isbn.present?
      @book.fetch_details_from_open_library
    end

    if @book.save
      redirect_to @book, notice: "Book successfully created."
    else
      render :new
    end
  end

  # GET /books/:id/edit
  def edit
  end

  # PATCH/PUT /books/:id
  def update
    if @book.update(book_params)
      redirect_to @book, notice: "Book successfully updated."
    else
      render :edit
    end
  end

  # DELETE /books/:id
  def destroy
    @book.destroy
    redirect_to books_url, notice: "Book and its reviews were successfully deleted."
  end

  private

  # Set the book for actions that require a book
  def set_book
    @book = Book.find(params[:id])
  end

  # Only allow a list of trusted parameters through
  def book_params
    params.require(:book).permit(:title, :author, :isbn)
  end
end
