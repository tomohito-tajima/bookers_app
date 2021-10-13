class BooksController < ApplicationController
    def index
        @books = Book.all
        @book = Book.new
    end


    def create
        @book = Book.new(book_params)
        if @book.save
            flash[:notice] = "Book was successfully created."
            redirect_to book_path(@book.id)
        else
            @books = Book.all
            flash[:alert] = 'メッセージを入力してください。'
            render :index
        end
    end

    def show
        @book = Book.find(params[:id])
    end

    def edit
        @book = Book.find(params[:id])
    end

    def update
        @book = Book.find(params[:id])
        if @book.update(book_params)
            flash[:notice] = "Book was successfully updated."
            redirect_to book_path(@book.id)
        else
            flash.now[:alert] = 'メッセージを入力してください。'
            render :edit
        end
    end

    def destroy
        book = Book.find(params[:id])
        book.destroy
        redirect_to books_path
    end

    private
    #ストロングパラメータ
    def book_params
        # param is missing or the value is empty: bookが出るためを削除。
        params.require(:book).permit(:title, :body)
    end

end
