class ChaptersController < ApplicationController
    protect_from_forgery with: :null_session
    def new
        @chapter = Chapter.new
    end
    def show
        @chapter_id = params[:id]
        @chapter = Chapter.find(@chapter_id)
    end

    def create
        InsertChapter(params)
        redirect_to root_path
    end

    private

    def InsertChapter(form)
        Chapter.create(teacher_id: form[:user_id], chapter_name: form[:chapter_name], chapter_description: form[:chapter_description],subject_id: form[:subject_id],book_id: form[:book_id],section_id: form[:section_id])
        Chapter.last.update(url_path: "/chapters/#{Chapter.last.id}")
    end
end
