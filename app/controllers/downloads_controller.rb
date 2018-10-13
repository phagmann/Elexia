class DownloadsController < ApplicationController
        require 'caracal-rails'
        def index
            p params
            @book_id = params[:book_id].to_i
            @current_user_id = params[:user_id].to_i
            
            respond_to do |format|
              format.docx { 
                headers["Content-Disposition"] = "attachment; filename=\"notes.docx\"" 
            }
            end
        end

        


    
end






# (1..6).each do |i|
#     n = Note.find_by(note_type: i, user_id: current_user.id, box_id: box.id)
#     if !n.blank?
#         li '#{n.text}' do
#     end


# end