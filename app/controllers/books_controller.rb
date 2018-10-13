class BooksController < ApplicationController
    protect_from_forgery with: :null_session
    
    def new
        @book = Book.new
    end
    def show
        @book_id = params[:id]
        @book = Book.find(@book_id)
        BookVisitLog.create(book_id: @book_id, user_id: current_user.id)
    end

    def update
    end

    def create
        InsertBook(params)
        redirect_to root_path
    end




    private

    def InsertBook(form)    
        Book.create(teacher_id: form[:user_id], book_name: form[:book_name], book_description: form[:book_description], subject_id: form[:subject_id], book_weights_string_list: form[:book_weights_string_list])
        Book.last.update(url_path: "/books/#{Book.last.id}")
    end
end

# books = Subject.find(1).teacher_books(User.find(1)).select("books.*","MAX(book_visit_logs.created_at) as time_order").joins("LEFT JOIN book_visit_logs ON books.teacher_id = book_visit_logs.user_id ").group("books.id,books.teacher_id,books.subject_id,books.book_name,books.book_description,books.url_path").order("time_order desc").distinct