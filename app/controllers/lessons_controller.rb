class LessonsController < ApplicationController
    protect_from_forgery with: :null_session
    def new
        
        @lesson = Lesson.new
        if !params.key?("pages")
            params.permit(:pages,:user_id)
            params['pages'] = 0
            params['user_id'] = current_user.id
        else
            params[:pages] = params[:pages].to_i + 1
        end
    end

    def show
        @lesson = Lesson.find(params[:id])
        render layout: false
    end

    def create
        LessonCreationLogic(params)
        redirect_to root_path
    end

    private

    def LessonCreationLogic(form)
        Lesson.create(teacher_id: form[:user_id], lesson_name: form[:lesson_name], lesson_description: form[:lesson_description],subject_id: form[:subject_id],book_id: form[:book_id],section_id: form[:section_id],chapter_id: form[:chapter_id])
        p form
        p "================="

        (1..form["page_max"].to_i).each do |boxform_id|
            p "header_#{boxform_id}"
            p form["header_#{boxform_id}"]
            p "================="
            Box.create(lesson_id: Lesson.last.id)
            box_id = Box.last.id
            video_id = nil
            pic_id = nil
            powerpoint_id = nil
            doc_id = nil
            paragraph_id = nil
            solve_id = nil
            if form["video_#{boxform_id}"] != ''
                Video.create(box_id: box_id, note_type: 1, video_url: form["video_#{boxform_id}"].sub('watch?v=', "embed/"))
                video_id = Video.last.id
            end
            if form["figure_#{boxform_id}"] != ''
                Pic.create(box_id: box_id, note_type: 2, pic_url: form["figure_#{boxform_id}"])
                pic_id = Pic.last.id
            end
            if form["point_#{boxform_id}"] != ''
                Powerpoint.create(box_id: box_id, note_type: 3, powerpoint_url: form["point_#{boxform_id}"])
                powerpoint_id = Powerpoint.last.id
            end
            if form["doc_#{boxform_id}"] != ''
                Doc.create(box_id: box_id, note_type: 4, doc_url: form["doc_#{boxform_id}"])
                doc_id = Doc.last.id
            end
            if form["paragraph_#{boxform_id}"] != ''
                Paragraph.create(box_id: box_id, note_type: 5, paragraph_text: form["paragraph_#{boxform_id}"])
                paragraph_id = Paragraph.last.id
            end
            if form["solve_#{boxform_id}"] != ''
                Solve.create(box_id: box_id, note_type: 6, solve_math: form["solve_#{boxform_id}"])
                solve_id = Solve.last.id
            end
            
            

            box = Box.find(box_id)
            box.update( video_id: video_id, pic_id: pic_id,powerpoint_id: powerpoint_id,doc_id: doc_id, ordering: boxform_id, title: form["header_#{boxform_id}"],paragraph_id: paragraph_id,solve_id: solve_id)

        end
    end
end
