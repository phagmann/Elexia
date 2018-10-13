class SubjectsController < ApplicationController
    protect_from_forgery with: :null_session
    def new
        @subject = Subject.new
    end
    def create
        InsertSubject(params)
        redirect_to root_path
    end

    private

    def InsertSubject(form)
        Subject.create(teacher_id: form[:user_id], subject_name: form[:subject_name], subject_description: form[:subject_description])
    end
end
