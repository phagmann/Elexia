class GradesController < ApplicationController
    protect_from_forgery with: :null_session
    def index
        @book = Book.find(params[:book_id].to_i)
    end

    def student_grade
        if params.has_key?(:myInput1)
            @book = Book.find(params[:book_id].to_i)
            @student = User.find(params[:user_id].to_i)
            @teacher = current_user
        else
            @book = Book.find(params[:book_id].to_i)
            @student = current_user
            @teacher = User.find(@book.teacher_id)
        end
        @grades = Grade.where( student_id: @student.id, book_id: @book.id).select("grades.*, assignments.*").joins("INNER JOIN assignments ON assignments.id = grades.assignment_id").order('grade_weight_index, order_placement')

        p @grades
    end

end
