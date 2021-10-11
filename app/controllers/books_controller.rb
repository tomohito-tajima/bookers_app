class BooksController < ApplicationController
    def index
        @books = Book.all
    end

    def new
        @book = Book.new
    end

    def create
        book = Book.new(book_params)
        book.save
        redirect_to books_path
    end

    def show
        @book = Book.find(params[:id])
    end

    def edit
    end

    def destroy
    end

    private
    #ストロングパラメータ
    def book_params
        # param is missing or the value is empty: bookが出るため.require(:book)を削除。
        params.permit(:title, :body)
    end

end
