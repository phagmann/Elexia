class SectionsController < ApplicationController
    protect_from_forgery with: :null_session
    def new
        @section = Section.new
    end

    def create
        InsertSection(params)
        redirect_to root_path
    end

    private

    def InsertSection(form)
        Section.create(teacher_id: form[:user_id], section_name: form[:section_name], section_description: form[:section_description],subject_id: form[:subject_id],book_id: form[:book_id])
    end
end
