class EnrollmentsController < ApplicationController
    protect_from_forgery with: :null_session
    def index
        @book = Book.find(params[:book_id].to_i)
    end

    def create
        @book = Book.find(params[:book_id].to_i)
        InsertEnroll(params)
        # TODDO: send comfirmation email/text?
        redirect_to book_path @book
    end

    private

    def InsertEnroll(form)
        p form
        book = Book.find(form[:book_id])
        Enrollment.create(student_id: form[:user_id], teacher_id: book.teacher_id ,book_id: form[:book_id], subject_id: book.subject_id)
    end
end
