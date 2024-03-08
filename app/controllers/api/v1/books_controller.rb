module Api
  module V1
    class BooksController < ApiController
      before_action :set_book, only: %i[ show update destroy ]

      # GET /books or /books.json
      def index
        @books = Book.all
        respond_with @books, view: :index
      end

      # GET /books/1 or /books/1.json
      def show
        if @book
          respond_with @book, view: :show
        else
          render json: @book.errors
        end
      end

      # POST /books or /books.json
      def create
        @book = Book.new(book_params)

        if @book.save
          render json: @book
        else
          render json: @book.errors
        end
      end

      # PATCH/PUT /books/1 or /books/1.json
      def update
        if @book.update(book_params)
          render json: @book
        else
          render json: @book.errors
        end
      end

      # DELETE /books/1 or /books/1.json
      def destroy
        @book.destroy!

        render json: {notice: "Book successfully destroyed"}
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_book
        @book = Book.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def book_params
        if (params[:book][:author_id].present?)
          return params.require(:book).permit(:title, :isbn, :author_id)
        end
        author = Author.new(params.require(:author).permit(:first_name, :last_name))
        book = params.require(:book).permit(:title, :isbn)
        book[:author] = author

        book
      end
    end
  end
end
